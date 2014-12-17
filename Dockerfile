FROM joshuacox/huboard-base

ENV SEGMENTIO_KEY HUBOARD_SEGMENTIO_KEY

RUN cd /app;git pull

ADD .env /app/.env
RUN echo SESSION_SECRET=$(openssl rand -base64 32) >>/app/.env

EXPOSE 5000

VOLUME ["/apprun/data"]

ENTRYPOINT ["/apprun/init"]
CMD ["app:start"]
