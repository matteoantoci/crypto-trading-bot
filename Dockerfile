FROM node:lts

# Install build-essential, sqlite in order
RUN apt-get update && apt-get install -y sqlite && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . .

# Bundle app source
RUN npm ci --production

# Apply all patches in app
RUN npm run postinstall && sqlite3 bot.db < bot.sql

EXPOSE 8080

#VOLUME /usr/src/app

RUN ls

CMD node index.js trade
