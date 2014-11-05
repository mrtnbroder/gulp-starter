
# browserify task
#   ---------------
#   Bundle javascripty things with browserify!
#
#   If the watch task is running, this uses watchify instead
#   of browserify for faster bundling using caching.
#
#
#

'use strict'

gulp             = require('gulp')
gulpif           = require('gulp-if')
gutil            = require('gulp-util')
webpack          = require('webpack')
webpackDevServer = require('webpack-dev-server')
webpackConfig    = require('../../webpack.config')
bundleLogger     = require('../util/bundleLogger')
handleErrors     = require('../util/handleErrors')
# ngAnnotatePlugin = require('ng-annotate-webpack-plugin')


gulp.task 'webpack:dev', (cb) ->
  webpackDevConfig = Object.create(webpackConfig)
  devCompiler = undefined
  webpackDevConfig.devtool = 'eval'
  webpackDevConfig.debug = true
  devCompiler = webpack(webpackDevConfig)

  new webpackDevServer(devCompiler,
    contentBase: 'public/'
    publicPath:  'http://localhost:8080/'
    hot: false
    stats:
      colors: true
  ).listen 8080, 'localhost', (err) ->
    if err
      throw new gutil.PluginError('webpack:dev', err)
    cb()


gulp.task 'webpack:build', (cb) ->

  webpackProductionConfig = Object.create(webpackConfig)

  webpackProductionConfig.plugins = webpackProductionConfig.plugins.concat(
    new webpack.DefinePlugin('process.env':
      NODE_ENV: JSON.stringify('production')
    ),
    new webpack.optimize.DedupePlugin(),
    # new ngAnnotatePlugin(add: true),
    new webpack.optimize.UglifyJsPlugin()
  )

  webpack webpackProductionConfig, (err, stats) ->
    if err
      throw new gutil.PluginError('webpack:dev', err)
    gutil.log '[webpack:build]', stats.toString(colors: true)
    cb()


