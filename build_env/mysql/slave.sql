CHANGE MASTER TO master_host='mysqlmaster', master_port=3306, MASTER_USER='repl', MASTER_PASSWORD='slavepass';
START SLAVE;
