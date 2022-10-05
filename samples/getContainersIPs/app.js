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

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello from node server\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
