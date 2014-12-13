FROM joshuacox/ubuntu-nginx

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install memcached couchdb redis-server

# Install Huboard
RUN git clone -b master https://github.com/rauhryan/huboard.git /app
# slightly alter gemfile for 2.1.5 ruby
RUN cd /app; sed 's/2.1.2/2.1.5/' Gemfile; rm Gemfile.lock
RUN cd /app; bundle install --deployment;
ADD .env /app/.env
RUN echo SESSION_SECRET=$(openssl rand -base64 32) >>/app/.env
#ADD Procfile /app/Procfile
