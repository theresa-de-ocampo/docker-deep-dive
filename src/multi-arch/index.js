const http = require("http");
const os = require("os");

const port = 8000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader("Content-Type", "text/plain");
  res.end(`Hello from Node.js in ${os.platform()}/${process.arch}`);
});

server.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}/`);
});
