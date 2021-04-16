FROM node:lts

# Install build-essential, sqlite in order
RUN apt-get update && apt-get install -y sqlite && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
COPY package-lock.json /usr/src/app/
RUN npm ci --production

# Bundle app source
COPY . /usr/src/app
RUN cp instance.js.dist instance.js && cp conf.json.dist conf.json && sqlite3 bot.db < bot.sql

# Apply all patches in app
RUN npm run postinstall

EXPOSE 8080

CMD npm start
