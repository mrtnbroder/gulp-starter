
browserSync = require("browser-sync")
gulp        = require("gulp")


gulp.task "browserSync", ["build"], ->
  browserSync
    files: ['public/**']
    proxy: 'localhost:8080'
    notify: true

  return

