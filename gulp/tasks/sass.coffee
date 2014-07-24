
# compass      = require("gulp-compass")
sass         = require("gulp-sass")
autoprefixer = require("gulp-autoprefixer")
csso         = require("gulp-csso")
gulp         = require("gulp")
handleErrors = require("../util/handleErrors")

gulp.task "sass", ->

  dest = "./public"

  gulp.src("./src/sass/app.{scss,sass}")
    .pipe(sass(
      precision: 7
      outputStyle: "nested"
    ))
    .on("error", handleErrors)
    .pipe(autoprefixer([
      "> 1%"
    ]))
    .pipe(csso())
    .pipe(gulp.dest(dest))
