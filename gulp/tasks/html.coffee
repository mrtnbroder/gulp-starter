
gulp     = require("gulp")
gulpif   = require("gulp-if")
php2html = require("gulp-php2html")
rev      = require("gulp-rev-mtime")

gulp.task "html", ->

  html = [
    "./src/htdocs/*.{html,php}"
  ]

  gulp.src(html)
    .pipe(php2html())
    .pipe(gulpif( global.isProduction, rev('cwd': './public') ))
    .pipe(gulp.dest("./public"))

