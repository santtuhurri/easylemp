#!/bin/bash

mysql -sfu root <<EOS
# delete anonymous users
DELETE FROM mysql.user WHERE User='';
# delete remote root capabilities
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# drop database 'test'
DROP DATABASE IF EXISTS test;
# also make sure there are lingering permissions to it
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
# make a new database
CREATE DATABASE shoplist CHARACTER SET utf8;
# make a new user
GRANT ALL ON shoplist.* TO shoplist@localhost IDENTIFIED BY 'USERshopl157forDEBIAN22';
# switch to shoplist database
USE shoplist;
# make a new table
CREATE TABLE items(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(1024));
# add items in to the table
INSERT INTO items('name') VALUES ('carrot');
INSERT INTO items('name') VALUES ('tomato');
INSERT INTO items('name') VALUES ('kale');
# make changes immediately
FLUSH PRIVILEGES;
EOS
