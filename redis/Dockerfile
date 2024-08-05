FROM redis:latest

ENV TZ $TZ

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

EXPOSE 6379

CMD ["redis-server"]
