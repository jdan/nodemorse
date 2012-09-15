http = require 'http',
url  = require 'url',
router = require './router',
socket = require './socket'

console.log 'Starting Server...'

app = http.createServer (req, res) ->
  res.writeHead 200
  path = url.parse(req.url).pathname

  router.route(res)[path]()
.listen 3000

socket.config app
