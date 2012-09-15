io = require 'socket.io'

exports.config = (app) ->
  io = io.listen app

  io.sockets.on 'connection', (client) ->
    client.on 'join', (data) ->
      client.join(data.room)
      client.set('room', data.room)

    client.on 'on', (data) ->
      client.get 'room', (err, room) ->
        io.sockets.in(room).emit 'on'

    client.on 'off', (data) ->
      client.get 'room', (err, room) ->
        io.sockets.in(room).emit 'off'
