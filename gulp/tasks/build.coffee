
gulp     = require("gulp")
sequence = require("run-sequence")

tasks = [
  "browserify"
  "sass"
  "images"
  "copy"
]

if global.isProduction
  gulp.task "build", ->
    sequence tasks, "uncss"
else
  gulp.task "build", tasks
