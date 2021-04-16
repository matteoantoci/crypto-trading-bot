FROM node:lts

# Install build-essential, sqlite in order
RUN apt-get update && apt-get install -y sqlite && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . .

RUN yarn --pure-lockfile --prod && yarn postinstall && sqlite3 bot.db < bot.sql

EXPOSE 8080

CMD node trade.js
