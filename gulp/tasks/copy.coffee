
gulp = require("gulp")

gulp.task "copy", ->
  gulp.src("src/htdocs/**")
    .pipe gulp.dest("build")

