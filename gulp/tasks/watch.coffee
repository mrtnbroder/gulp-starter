
gulp = require("gulp")

gulp.task "watch", [
  "setWatch"
  "browserSync"
], ->
  # gulp.watch "src/sass/grid.{scss,sass}", ["grid"]
  gulp.watch "src/sass/**", ["sass"]
  gulp.watch "src/images/**", ["images"]
  gulp.watch "src/htdocs/**", ["copy"]
  return


# Note: The browserify task handles js recompiling with watchify
