/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "SakilaDatabase.h"
#include "MySQLConnection.h"
#include "MySQLPreparedStatement.h"

void SakilaDatabaseConnection::DoPrepareStatements()
{
    if (!m_reconnecting)
        m_stmts.resize(MAX_SAKILADATABASE_STATEMENTS);
    PrepareStatement(SAKILA_SEL_ACTOR_INFO, "select * from user1;", CONNECTION_SYNCH);
    PrepareStatement(SAKILA_SEL_ACTOR_INFO_ASYNC, "select * from user1;", CONNECTION_ASYNC);
}

SakilaDatabaseConnection::SakilaDatabaseConnection(MySQLConnectionInfo& connInfo) : MySQLConnection(connInfo)
{
}

SakilaDatabaseConnection::SakilaDatabaseConnection(ProducerConsumerQueue<SQLOperation*>* q, MySQLConnectionInfo& connInfo) : MySQLConnection(q, connInfo)
{
}

SakilaDatabaseConnection::~SakilaDatabaseConnection()
{
}
