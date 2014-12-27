sys = require('sys')
exec = require('child_process').exec
restify = require('restify')
_ = require('underscore')
nmap = require('node-libnmap').nmap

server = restify.createServer()
server.use(restify.CORS())
server.use(restify.fullResponse())

server.get '/arp', (req, res, next) ->
  exec 'arp -a', (error, stdout, stderr) ->
    arp = []
    _.each stdout.split('\n'), (line) ->
      [match, host, ip, mac] = /(\S+) \((\S*)\) at (\S*)/g.exec(line) if line
      arp.push(host: host, ip: ip, mac: mac) if host
    res.send arp

server.get '/arp/:host/ports', (req, res, next) ->
  opts = range: [req.params.host]
  nmap 'scan', opts, (err, report) ->
    throw err if err
    res.send report?.pop()?.pop()

server.del '/arp/:host', (req, res, next) ->
  exec "arp -d #{req.params.host}", (error, stdout, stderr) ->
    res.send 200 if stdout.match(/deleted/)
    res.send 500 if error

port = process.env.PORT || 3000

server.listen port, ->
  console.log "Listening on port #{port}"
