STOP SLAVE;
CREATE USER 'repl'@'%';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%' IDENTIFIED BY 'slavepass';
FLUSH PRIVILEGES;
