Backbone   = require 'backbone'
Backbone.$ = jQuery

module.exports = Backbone.View.extend

  template: require '../views/example'

  initialize: ->
    @render()

  render: ->
    @$el.html @template
      title: 'Gulp All The Things!'
      description: 'Starter Gulp + Browserify project equipped to handle the following:'
      tools: [
        'Browserify-shim'
        'Browserify / Watchify'
        'CoffeeScript'
        'Compass'
        'SASS'
        'Handlebars'
        'Image optimization'
        'LiveReload'
        'Non common-js jquery plugin'
        'Npm backbone'
        'Npm jquery'
        'Underscore (included with Backbone)'
      ]
