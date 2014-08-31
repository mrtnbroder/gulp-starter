
gulp         = require("gulp")
csso         = require("gulp-csso")
size         = require("gulp-size")
handleErrors = require("../util/handleErrors")

gulp.task "cssminify", ->

  dest = "./public"

  gulp.src("./public/app.css")
    .on("error", handleErrors)
    .pipe(csso())
    .pipe(gulp.dest(dest))
    .pipe(size())
