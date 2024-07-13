#ifndef THREAD_POOL_H
#define THREAD_POOL_H

#include <vector>
#include <queue>
#include <memory>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <future>
#include <functional>
#include <stdexcept>


class ThreadPool {
public:
    // 构造函数，传入线程数
    ThreadPool(size_t);
    // 入队任务(传入函数和函数的参数)
    template<class F, class... Args>
    auto enqueue(F&& f, Args&&... args) //任务管道函数
        -> std::future<std::invoke_result_t<F,Args...>>;   //利用尾置限定符  std::future用来获取异步任务的结果
    // 析构
    ~ThreadPool();
private:
    // 工作线程组 need to keep track of threads so we can join them
    std::vector< std::thread > workers;
    // 任务队列 the task queue
    std::queue< std::function<void()> > tasks;
    
    // 异步 synchronization
    std::mutex queue_mutex; // 队列互斥锁
    std::condition_variable condition;  // 条件变量
    bool stop;	// 停止标志
};
 
// 构造函数仅启动一些工作线程 the constructor just launches some amount of workers
inline ThreadPool::ThreadPool(size_t threads)
    :   stop(false)
{
    for(size_t i = 0; i< threads; ++i)
        // 添加线程到工作线程组
        workers.emplace_back(   // 与push_back类似，但性能更好(与此类似的还有emplace/emlace_front)，下面的就是工作线程lambda函数
            [this]
            {   
                for(;;) // 死循环，线程内不断的从任务队列取任务执行（这样写比while(true)效率更高？）
                {
                    std::function<void()> task; //线程中的函数对象
                    // 通过lock互斥获取一个队列任务和任务的执行函数（大括号作用：控制lock临时变量的生命周期，执行完毕或return后自动释放锁）
                    {
                        // 拿锁(独占所有权式)
                        std::unique_lock<std::mutex> lock(this->queue_mutex);
                        // 等待条件成立(当线程池被关闭或有可消费任务时跳过wait继续；否则condition.wait将会unlock释放锁，其他线程可以继续拿锁，
                        // 但此线程会阻塞此处并休眠，直到被notify_*唤醒，被唤醒时wait会再次lock并判断条件是否成立，如成立则跳过wait，否则unlock并休眠继续等待下次唤醒) 
                        this->condition.wait(lock, [this]{ return this->stop || !this->tasks.empty(); });
                        
                        // 如果线程池停止且任务队列为空，说明需要关闭线程池结束返回
                        if(this->stop && this->tasks.empty())
                            return;
                        // 取得任务队首任务(注意此处的std::move,为了调用移动构造函数提升性能)
                        task = std::move(this->tasks.front());
                        // 从队列移除
                        this->tasks.pop();
                    }
                    // 调用函数执行任务（执行任务时lock已释放，不影响其他线程取任务）
                    task();
                }
            }
        );
}

// 添加一个新的工作任务到线程池 add new work item to the pool
template<class F, class... Args>
auto ThreadPool::enqueue(F&& f, Args&&... args) 
    -> std::future<std::invoke_result_t<F,Args...>>
{
    using return_type = std::invoke_result_t<F,Args...>;
    // 将任务函数和其参数绑定，构建一个packaged_task(packaged_task是对任务的一个抽象，咱们能够给其传递一个函数来完成其构造。以后将任务投递给任何线程去完成，经过packaged_task.get_future()方法获取的future来获取任务完成后的产出值)
    auto task = std::make_shared< std::packaged_task<return_type()> >(  //指向F函数的智能指针
            std::bind(std::forward<F>(f), std::forward<Args>(args)...)  //传递函数进行构造(构建std::packaged_task<return_type()>需要一个函数)
        );
    // 获取任务的future
    std::future<return_type> res = task->get_future();
    {
        // 独占拿锁
        std::unique_lock<std::mutex> lock(queue_mutex);

        // 不允许入队到已经停止的线程池 don't allow enqueueing after stopping the pool
        if(stop)
            throw std::runtime_error("enqueue on stopped ThreadPool");
        // 将任务添加到任务队列
        tasks.emplace([task](){ (*task)(); });
    }
    // 发送通知，唤醒一个wait状态的工作线程重新抢锁并重新判断wait条件
    condition.notify_one();
    return res;
}

// 析构线程池 the destructor joins all threads
inline ThreadPool::~ThreadPool()
{
    {
        // 拿锁
        std::unique_lock<std::mutex> lock(queue_mutex);
        // 停止标志置true
        stop = true;
    }
    // 通知所有工作线程重新抢锁并重新判断wait条件，唤醒后因为stop为true了，所以都会结束
    condition.notify_all();
    // 等待所有工作线程结束
    for(std::thread &worker: workers)
        worker.join();  //由于线程都开始竞争了，因此必定会执行完，join可等待线程执行完
}

#endif