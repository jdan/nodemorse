fs = require 'fs'

root = (res) ->
  ->
    res.end 'This is root'

serve = (res, file) ->
  ->
    fd = fs.createReadStream file
    fd.pipe res

exports.route = (res) ->
  '/': root(res)
  '/favicon.ico': -> res.end ''
  '/js/main.js': serve(res, 'js/main.js')
