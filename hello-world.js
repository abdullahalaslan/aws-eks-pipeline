var http = require('http');

var server = http.createServer(function(req, res) {
res.writeHead(200);
res.write('Hello World From NodeJS Abdullah');
res.end();
});
server.listen(8080)