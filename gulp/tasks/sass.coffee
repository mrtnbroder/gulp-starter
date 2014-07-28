
# compass    = require("gulp-compass")
sass         = require("gulp-sass")
autoprefixer = require("gulp-autoprefixer")
cmq          = require("gulp-combine-media-queries")
csso         = require("gulp-csso")
size         = require("gulp-size")
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
    .pipe(cmq(log: true))
    .pipe(csso())
    .pipe(gulp.dest(dest))
    .pipe(size())
