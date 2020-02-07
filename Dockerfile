FROM node:8.15.0-alpine

RUN mkdir -p /home/node/app/node_modules
WORKDIR /home/node/app

RUN mkdir -p /run/nginx

COPY ./src /www

RUN apk update && apk upgrade \
    && apk add --no-cache git \
    && apk --no-cache add --virtual builds-deps build-base python nginx


COPY ./dashboard.conf /etc/nginx/conf.d/default.conf


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
