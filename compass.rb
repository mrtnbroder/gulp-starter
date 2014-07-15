# ==============================
#
# Compass Config
#
# ==============================

require 'susy'
require 'breakpoint'

preferred_syntax = :scss
http_path        = '/'
css_dir          = 'build'
sass_dir         = 'src/sass'
images_dir       = 'build/images'
fonts_dir        = 'build/fonts'
relative_assets  = true
line_comments    = true
output_style     = :nested

Sass::Script::Number.precision = 7
