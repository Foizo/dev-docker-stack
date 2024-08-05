#!/usr/bin/env bash
set -e

# create example user "board" with pass "board" and create database "board"
mysql -v -uroot -p${MYSQL_ROOT_PASSWORD} <<-EOSQL
  CREATE USER IF NOT EXISTS 'example-user'@'%' IDENTIFIED WITH mysql_native_password BY 'example-pass';
  CREATE DATABASE IF NOT EXISTS example;
  GRANT ALL ON example.* TO 'example-user'@'%';
  FLUSH PRIVILEGES;
EOSQL

# import data to database
#zcat /usr/local/bin/other-mysql-script/example.sql.gz | mysql -v -uroot -p${MYSQL_ROOT_PASSWORD} example
