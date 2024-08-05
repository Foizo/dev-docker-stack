FROM rabbitmq:alpine

ENV TZ $TZ

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

RUN rabbitmq-plugins enable --offline rabbitmq_management

EXPOSE 5672 15672 15671
