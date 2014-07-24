
gulp     = require("gulp")
php2html = require("gulp-php2html")
# rev      = require("gulp-rev-mtime")

gulp.task "copy", ->
  gulp.src("src/htdocs/**")
    .pipe(php2html())
    # .pipe(rev(
    #   'cwd': 'public'
    # ))
    .pipe(gulp.dest("public"))

