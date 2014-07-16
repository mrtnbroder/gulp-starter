
compass      = require("gulp-compass")
sass         = require("gulp-sass")
autoprefixer = require("gulp-autoprefixer")
csso         = require("gulp-csso")
gulp         = require("gulp")
handleErrors = require("../util/handleErrors")

gulp.task "compass", ->

  dest = "./build"

  gulp.src("./src/sass/app.{scss,sass}")
    .pipe(sass(precision: 7))
    .on("error", handleErrors)
    .pipe(autoprefixer([
      "> 1%"
    ]))
    .pipe(csso())
    .pipe(gulp.dest(dest))

# gulp.task "grid", ->

#   dest = "./build"

#   gulp.src("./src/sass/grid.{scss,sass}")
#     .pipe(compass(
#       config_file: "compass.rb"
#       css: "build"
#       sass: "src/sass"
#     ))
#     .on("error", handleErrors)
#     # .pipe(autoprefixer([
#     #   "> 1%"
#     # ]))
#     # .pipe(csso())
#     .pipe(gulp.dest(dest))
