FROM joshuacox/huboard-base

ENV SEGMENTIO_KEY HUBOARD_SEGMENTIO_KEY

RUN apt-get update
RUN apt-get -y install nodejs supervisor
RUN apt-get -y install memcached couchdb redis-server ruby2.1-dev build-essential libssl-dev
RUN apt-get -y install libcurl4-openssl-dev libssl-dev libmagickcore-dev libmagickwand-dev libmysqlclient-dev libpq-dev libxslt1-dev libffi-dev libyaml-dev zlib1g-dev

ADD supervisor/supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD supervisor/couchdb.conf /etc/supervisor/conf.d/couchdb.conf
ADD supervisor/redis.conf /etc/supervisor/conf.d/redis.conf
ADD supervisor/foreman.conf /etc/supervisor/conf.d/foreman.conf
RUN sed -i 's/daemonize\ yes/daemonize\ no/' /etc/redis/redis.conf
RUN mkdir -p /var/run/couchdb
RUN chown -R couchdb. /var/run/couchdb

ADD assets/setup/ /app/setup/
RUN chmod 755 /app/setup/install
RUN /app/setup/install

ADD assets/VERSION /apprun/
ADD assets/config/ /apprun/config/
ADD assets/config/huboard/unicorn.rb /apprun/config/
ADD assets/init /apprun/init
RUN chmod 755 /apprun/init
RUN mkdir -p /app/tmp/pids
RUN mkdir -p /app/tmp/sockets
RUN mkdir -p /app/log
RUN chown -R huboard. /apprun
RUN chown -R huboard. /app
#RUN useradd huboard

ADD .env /app/.env
RUN echo SESSION_SECRET=$(openssl rand -base64 32) >>/app/.env

EXPOSE 5000

VOLUME ["/apprun/data"]

ENTRYPOINT ["/apprun/init"]
CMD ["app:start"]
