const { build } = require('estrella');

build({
  entry: 'trade.js',
  outfile: 'bundle.js',
  bundle: true,
  platform: 'node'
  // pass any options to esbuild here...
});
