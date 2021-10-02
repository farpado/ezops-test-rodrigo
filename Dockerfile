FROM node:14.18.0-slim as builder

WORKDIR /app

ADD package.json .
ADD package-lock.json .

RUN npm install --production


FROM node:14.18.0-slim

ARG APP_PORT=3000
ARG DB_STR_CONNECTION=

ENV APP_PORT=$APP_PORT
ENV DB_STR_CONNECTION=$DB_STR_CONNECTION

WORKDIR /app

ADD . .

COPY --from=builder /app/node_modules /app/node_modules

ENTRYPOINT ["npm", "run", "prod"]




