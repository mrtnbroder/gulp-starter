
changed  = require("gulp-changed")
gulp     = require("gulp")
gulpif   = require("gulp-if")
imagemin = require("gulp-imagemin")

gulp.task "images", ->
  dest = "./public/images"

  # Ignore unchanged files
  # Optimize
  gulp.src("./src/images/**")
    .pipe(changed(dest))
    .pipe(gulpif( global.isProduction,
      imagemin(
        optimizationLevel: 3
        progressive: true
        interlaced: true
        silent: true
      )
    ))
    .pipe gulp.dest(dest)

