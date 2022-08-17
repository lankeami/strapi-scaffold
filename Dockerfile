FROM node:lts-alpine

RUN apk add --no-cache sqlite

# make the 'app' folder the current working directory
WORKDIR /srv

COPY . .

WORKDIR /srv/app

expose 1337

ENTRYPOINT ["yarn", "develop"]
