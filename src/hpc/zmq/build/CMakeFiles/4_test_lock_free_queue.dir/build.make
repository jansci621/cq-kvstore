# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/chenqi1/cq-kvstore/src/hpc/zmq

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/chenqi1/cq-kvstore/src/hpc/zmq/build

# Include any dependencies generated for this target.
include CMakeFiles/4_test_lock_free_queue.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/4_test_lock_free_queue.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/4_test_lock_free_queue.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/4_test_lock_free_queue.dir/flags.make

CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.o: CMakeFiles/4_test_lock_free_queue.dir/flags.make
CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.o: ../4_test_lock_free_queue.cpp
CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.o: CMakeFiles/4_test_lock_free_queue.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/chenqi1/cq-kvstore/src/hpc/zmq/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.o -MF CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.o.d -o CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.o -c /home/chenqi1/cq-kvstore/src/hpc/zmq/4_test_lock_free_queue.cpp

CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/chenqi1/cq-kvstore/src/hpc/zmq/4_test_lock_free_queue.cpp > CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.i

CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/chenqi1/cq-kvstore/src/hpc/zmq/4_test_lock_free_queue.cpp -o CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.s

# Object files for target 4_test_lock_free_queue
4_test_lock_free_queue_OBJECTS = \
"CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.o"

# External object files for target 4_test_lock_free_queue
4_test_lock_free_queue_EXTERNAL_OBJECTS =

4_test_lock_free_queue: CMakeFiles/4_test_lock_free_queue.dir/4_test_lock_free_queue.cpp.o
4_test_lock_free_queue: CMakeFiles/4_test_lock_free_queue.dir/build.make
4_test_lock_free_queue: CMakeFiles/4_test_lock_free_queue.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/chenqi1/cq-kvstore/src/hpc/zmq/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable 4_test_lock_free_queue"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/4_test_lock_free_queue.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/4_test_lock_free_queue.dir/build: 4_test_lock_free_queue
.PHONY : CMakeFiles/4_test_lock_free_queue.dir/build

CMakeFiles/4_test_lock_free_queue.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/4_test_lock_free_queue.dir/cmake_clean.cmake
.PHONY : CMakeFiles/4_test_lock_free_queue.dir/clean

CMakeFiles/4_test_lock_free_queue.dir/depend:
	cd /home/chenqi1/cq-kvstore/src/hpc/zmq/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/chenqi1/cq-kvstore/src/hpc/zmq /home/chenqi1/cq-kvstore/src/hpc/zmq /home/chenqi1/cq-kvstore/src/hpc/zmq/build /home/chenqi1/cq-kvstore/src/hpc/zmq/build /home/chenqi1/cq-kvstore/src/hpc/zmq/build/CMakeFiles/4_test_lock_free_queue.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/4_test_lock_free_queue.dir/depend

