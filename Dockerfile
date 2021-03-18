FROM node:14-alpine3.10

RUN addgroup -S appgroup && adduser -S appuser -G appgroup && mkdir /app
RUN chown -R appuser:appgroup /app
WORKDIR /app
USER appuser

COPY . /app
WORKDIR /app
RUN yarn install

ENV TILE_SET_CACHE 128
ENV TILE_SET_PATH /app/data
ENV MAX_POST_SIZE 700kb

EXPOSE 3000

CMD ["yarn", "run", "start"]
