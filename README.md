# DEV Docker Stack

### Components
1. MySQL:latest 
2. RabbitMQ:alpine
3. Redis:latest
4. Maildev
5. ElasticSearch:8.14.0

### Installing and run project using docker:
1. [Install Docker Compose](https://docs.docker.com/compose/install/)
2. Add domain to local 'hosts' file: (`/etc/hosts`):
```
## dev-docker-stack
127.0.0.1	dev.docker.stack
```
3. Run `docker compose build`
4. Run `start.sh`

### Availability:
```
## database
dev.docker.stack:33061

## maildev
dev.docker.stack:8080 //http
dev.docker.stack:8025 //smtp

## rabbit
dev.docker.stack:8080

## redis
dev.docker.stack:6379

## elastic
dev.docker.stack:9200

... more in .env file
```

### Supported commands
**Start containers**
```
start.sh
```

**Stop containers**
```
stop.sh
```

#### Supported commands with running services
- Run mysql shell script in dir `./mysql/other-shell-scripts/`
```
mysql-run-scripts.sh
```

```
example: create user and database 01-init-example-db.sh

#!/usr/bin/env bash
set -e

# create example user and database
mysql -v -uroot -p${MYSQL_ROOT_PASSWORD} <<-EOSQL
  CREATE USER IF NOT EXISTS 'example-user'@'%' IDENTIFIED WITH mysql_native_password BY 'example-pass';
  CREATE DATABASE IF NOT EXISTS example;
  GRANT ALL ON example.* TO 'example-user'@'%';
  FLUSH PRIVILEGES;
EOSQL

# import data to database
zcat /usr/local/bin/other-mysql-script/example.sql.gz | mysql -v -uroot -p${MYSQL_ROOT_PASSWORD} example
```
