
'use strict'

gulp = require('gulp')
sequence = require('run-sequence')

devTasks = [
  'webpack:dev'
  'sass'
  'images'
  'copy'
]

buildTasks = [
  'webpack:build'
  'sass'
  'images'
  'copy'
]

if global.isProduction
  gulp.task 'build', ->
    sequence buildTasks
else
  gulp.task 'build', devTasks
