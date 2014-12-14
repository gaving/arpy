sys = require('sys')
exec = require('child_process').exec
restify = require('restify')
_ = require('underscore')

server = restify.createServer()
server.use(restify.CORS())
server.use(restify.fullResponse())

server.get '/arp', (req, res, next) ->
  exec 'arp -a', (error, stdout, stderr) ->
    arp = []
    _.each stdout.split('\n'), (line) ->
      [match, host, ip, mac] = /(\S+) \((\S*)\) at (\S*)/g.exec(line) if line
      arp.push(host: host, ip: ip, mac: mac) if host
    res.send(arp)

server.listen 3000, ->
  console.log 'Listening on port 3000'
