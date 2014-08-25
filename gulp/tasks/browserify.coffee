
# browserify task
#   ---------------
#   Bundle javascripty things with browserify!
#
#   If the watch task is running, this uses watchify instead
#   of browserify for faster bundling using caching.
#
#
#

gulp         = require("gulp")
gulpif       = require("gulp-if")
uglify       = require("gulp-uglify")
streamify    = require("gulp-streamify")
browserify   = require("browserify")
watchify     = require("watchify")
bundleLogger = require("../util/bundleLogger")
handleErrors = require("../util/handleErrors")
source       = require("vinyl-source-stream")

gulp.task "browserify", ->

  bundler = browserify(
    # insertGlobals: true
    debug: !global.isProduction
    cache: {} # required for watchify
    packageCache: {} # required for watchify
    fullPaths: global.isWatching # required to be true only for watchify
    # Specify the entry point of your app
    entries: ["./src/coffeescript/app.coffee"]
    # Add file extentions to make optional in your requires
    extensions: [".coffee", ".hbs"]
  )

  if global.isWatching
    bundler = watchify(bundler)

  rebundle = ->

    # Log when bundling starts
    bundleLogger.start()

    bundler.bundle()
      # Report compile errors
      .on("error", handleErrors)
      # Use vinyl-source-stream to make the
      # stream gulp compatible. Specifiy the
      # desired output filename here.
      .pipe(source("app.js"))
      .pipe(gulpif(global.isProduction, streamify(uglify())))
      # Specify the output destination
      .pipe(gulp.dest("./public/"))
      # Log when bundling completes!
      .on "end", bundleLogger.end

  # Rebundle with watchify on changes.
  bundler.on "update", rebundle if global.isWatching
  rebundle()
