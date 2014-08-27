"use strict"

do (window, document) ->

  Example = require './controller/example'
  example = new Example(el: 'main')
  example.render()

  console.log "Hello from app.js!"
