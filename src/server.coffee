express = require 'express'
child_process = require 'child_process'
app = express()

app.use express.static '/srv/http/'

app.use express.bodyParser()
app.post '/gc/start', (req, res) ->
  console.log 'attempting to start server'
  child_process.exec 'wol 00:04:4B:05:80:AA', (error, stdout, stderr) ->
    console.log stdout
    res.send 'gothic castle has been awoken'

app.listen 8888
console.log 'Listening on port 8888'
