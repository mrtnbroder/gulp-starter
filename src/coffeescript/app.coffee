"use strict"

do (window, document) ->

  Example = require './controller/example'
  example = new Example()
  example.render()

  console.log "Hello from app.js!"
