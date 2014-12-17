FROM joshuacox/huboard-base
MAINTAINER Josh Cox <josh 'at' webhosting.coop>

RUN cd /app;git pull

ADD .env /app/.env

RUN echo SESSION_SECRET=$(openssl rand -base64 32) >>/app/.env

EXPOSE 5000

VOLUME ["/apprun/data"]

ENTRYPOINT ["/apprun/init"]

CMD ["app:start"]
