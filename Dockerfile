FROM joshuacox/huboard-base

ADD assets/config/ /apprun/config/
ADD assets/init /apprun/init
RUN chmod 755 /apprun/init
RUN useradd huboard

ADD .env /app/.env
RUN echo SESSION_SECRET=$(openssl rand -base64 32) >>/app/.env

EXPOSE 80
EXPOSE 443

VOLUME ["/apprun/data"]

ENTRYPOINT ["/apprun/init"]
CMD ["app:start"]
