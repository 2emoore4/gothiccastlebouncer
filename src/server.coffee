express = require 'express'
child_process = require 'child_process'
app = express()

app.use express.static '/srv/http/'

app.use express.bodyParser()
app.post '/gc/start', (req, res) ->
  console.log 'starting gothic castle'
  child_process.exec 'wol 00:04:4B:05:80:AA', (error, stdout, stderr) ->
    console.log stdout
    res.send 'gothic castle has been awoken'

app.get '/plex', (req, res) ->
  console.log 'getting a request for plex'
  res.send 'something will eventually be here.'

app.get '/sick', (req, res) ->
  console.log 'redirecting to sickbeard port'
  res.redirect 'http://evanmoore.no-ip.org:8081'

app.get '/sab', (req, res) ->
  console.log 'redirecting to sabnzbd port'
  res.redirect 'http://evanmoore.no-ip.org:8080'

app.get '/trans', (req, res) ->
  console.log 'redirecting to transmission port'
  res.redirect 'http://evanmoore.no-ip.org:9091'

app.get '/couch', (req, res) ->
  console.log 'redirecting to couchpotato port'
  res.redirect 'http://evanmoore.no-ip.org:5050'

app.listen 8888
console.log 'Listening on port 8888'
