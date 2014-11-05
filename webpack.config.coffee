'use strict'

path = require('path')
webpack = require('webpack')
nodeModulesPath = path.join(__dirname, 'node_modules')

module.exports =
  cache: true
  entry: './src/coffeescript/app.coffee'
  output:
    path: path.join(__dirname, 'public/js')
    # publicPath: 'public/'
  module:
    noParse: [
      /angular/
    ]
    loaders: [
      {
        test: /\.css$/
        loader: 'style-loader!css-loader'
      }
      {
        test: /\.coffee$/
        loader: 'coffee-loader'
      }
    # required for bootstrap icons
    # { test: /\.woff$/,   loader: 'url-loader?prefix=font/&limit=5000&mimetype=application/font-woff' },
    # { test: /\.ttf$/,    loader: 'file-loader?prefix=font/' },
    # { test: /\.eot$/,    loader: 'file-loader?prefix=font/' },
    # { test: /\.svg$/,    loader: 'file-loader?prefix=font/' },
    ]
  resolve:
    extensions: [
      ''
      '.webpack.js'
      '.web.js'
      '.js'
      '.coffee'
    ]

  resolveLoader:
    root: nodeModulesPath

  # plugins: [new webpack.ProvidePlugin(angular: 'exports?angular!angular')]
