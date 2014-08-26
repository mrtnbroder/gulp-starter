
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
    sequence tasks, "html", "uncss", "htmlminify"
else
  tasks.push "html"
  gulp.task "build", tasks
