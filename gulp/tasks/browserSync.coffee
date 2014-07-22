
browserSync = require("browser-sync")
gulp        = require("gulp")

gulp.task "browserSync", ["build"], ->
  browserSync.init ["public/**"],
    server:
      baseDir: "public"

  return

