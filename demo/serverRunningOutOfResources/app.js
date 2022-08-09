// run with:
//
// $ node app.js
// Server running at http://0.0.0.0:3000/
//
// test with:
//
// $ curl http://0.0.0.0:3000
// Hello from node server
const http = require('http');

const hostname = '0.0.0.0';
const port = 3000;

const serverName = process.argv[2]
const serverFowardedPort = process.argv[3]

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end(`server '${serverName}' says 'hello!'\n`);
});

server.listen(port, hostname, () => {
  console.log(`\nServer '${serverName}' running at http://${hostname}:${serverFowardedPort}/`);
});
