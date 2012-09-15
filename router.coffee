fs = require 'fs'

root = (res) ->
  ->
    res.end 'This is root'

serve = (res, file) ->
  ->
    fd = fs.createReadStream file
    fd.pipe res

exports.route = (res) ->
  '/': serve(res, 'views/index.html')
  '/favicon.ico': -> res.end ''
  '/js/main.js': serve(res, 'js/main.js')
  '/css/style.css': serve(res, 'css/style.css')
