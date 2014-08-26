
gulp     = require("gulp")
htmlmin  = require("gulp-htmlmin")

gulp.task "htmlminify", ->

  html = [
    "./public/*.html"
  ]

  gulp.src(html)
    .pipe(htmlmin(
      removeComments: true
      removeCommentsFromCDATA: false
      removeCDATASectionsFromCDATA: false
      collapseWhitespace: true
      conservativeCollapse: false
      collapseBooleanAttributes: true
      removeAttributeQuotes: true
      removeRedundantAttributes: true
      useShortDoctype: false
      removeEmptyAttributes: true
      removeScriptTypeAttributes: true
      removeStyleLinkTypeAttributes: true
      removeOptionalTags: false
      removeIgnored: false
      removeEmptyElements: false
      lint: false
      keepClosingSlash: false
      caseSensitive: false
      minifyJS: false
      minifyCSS: false
      # minifyURLs: false
      # ignoreCustomComments: []
      # processScripts: []
      # maxLineLength:
      # customAttrAssign: []
      # customAttrSurround: []
      # customAttrCollapse:
    ))
    .pipe(gulp.dest("public"))
