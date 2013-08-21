express = require 'express'
app = express()

app.use express.static '/srv/http/'

app.listen 8888
console.log 'Listening on port 8888'
