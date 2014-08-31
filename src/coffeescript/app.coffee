
"use strict"

angular = require 'angular'

do (window, document) ->

  App = angular.module 'app', [
    require 'angular-ui-router'
  ]

  console.log App
  console.log "Hello from app.js!"
