// run with:
//
// $ node app.js <app-name> <port>
// Server running at http://0.0.0.0:3000/
//
// test with:
//
// $ curl http://0.0.0.0:3000
// server '<app-name>' says 'hello!'
const express = require('express');

const hostname = '0.0.0.0';
const port = 3000;

const serverName = process.argv[2]
const serverFowardedPort = process.argv[3]

const server = express();

server.get('/', (req, res) => {
  res.send(`app '${serverName}' says 'hello!'\n`)
})

server.listen(port, hostname);

console.log(`\nsuper cool app '${serverName}' running at http://${hostname}:${serverFowardedPort}/`);