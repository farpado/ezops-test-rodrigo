FROM node:14.18.0-slim as builder

WORKDIR /app

ADD package.json .
ADD package-lock.json .

RUN npm install --production


FROM node:14.18.0-slim

WORKDIR /app

ADD . .

COPY --from=builder /app/node_modules /app/node_modules

ENTRYPOINT ["npm", "run", "prod"]




