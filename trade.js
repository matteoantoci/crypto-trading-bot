const TradeCommand = require('./src/command/trade.js');

// init
const services = require('./src/modules/services');

const instance = require('./instance.js');

async function start() {
  await services.boot(__dirname);

  const cmd = new TradeCommand(instance);
  cmd.execute();
}

start().catch(console.error);
