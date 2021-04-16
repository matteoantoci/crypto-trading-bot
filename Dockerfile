FROM node:10

# Install build-essential, sqlite in order
RUN apt-get update && apt-get install -y sqlite && rm -rf /var/lib/apt/lists/*

COPY . /usr/src/app

WORKDIR /usr/src/app

# Bundle app source
RUN npm install --production && npm cache clean --force

# Apply all patches in app
RUN npm run postinstall

RUN cp instance.js.dist instance.js && cp conf.json.dist conf.json && sqlite3 bot.db < bot.sql

EXPOSE 8080

VOLUME /usr/src/app

CMD npm start
