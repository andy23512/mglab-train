# require modules
require! <[fs gulp main-bower-files gulp-concat gulp-filter gulp-jade gulp-livereload gulp-livescript gulp-rename gulp-replace gulp-stylus gulp-util streamqueue tiny-lr]>

# important paths
paths =
  app: \app # app dir: for development
  build: \public # public dir: resultant website

# specify the paths of each type of file
paths.html = paths.app+\/**/*.html
paths.jade = paths.app+\/**/*.jade
paths.css = paths.app+\/**/*.css
paths.styl = paths.app+\/**/*.styl
paths.js = paths.app+\/**/*.js
paths.ls = paths.app+\/**/*.ls
paths.res = paths.app+\/res/**

# port setting for express, use your own port (just not to conflict with other)
port = parseInt(fs.readFileSync \port encoding: \utf-8)

# livereload port, sometimes it's useful. But in merry...
tiny-lr-port = 35729

# setup livereload server
tiny-lr-server = tiny-lr!

# a function to call the livereload server
livereload = -> gulp-livereload tiny-lr-server

# task: "html"
gulp.task \html ->
  html = gulp.src paths.html # get html files
  jade = gulp.src(paths.jade).pipe gulp-jade {+pretty} # get jade files and convert them to html 
  streamqueue {+objectMode}
    .done html, jade # when html and jade are done
    .pipe gulp.dest paths.build # put them to build
    .pipe livereload! # call livereload

# task: "css"
gulp.task \css ->
  # get css files in bower
  css-bower = gulp.src main-bower-files! .pipe gulp-filter \**/*.css .pipe gulp-replace /(\.\.\/)?themes\/default\/assets/g \.
  # get css files in app
  css-app = gulp.src paths.css
  # get styl files in app and convert them to css 
  # nib => cross-browser support
  styl-app = gulp.src(paths.styl).pipe gulp-stylus use: <[nib]>
  streamqueue {+objectMode}
    .done css-bower, css-app, styl-app
    .pipe gulp-concat \app.css # concat them to one file (why?)
    .pipe gulp.dest paths.build
    .pipe livereload!

# task: "js"
gulp.task \js ->
  # get js files in bower
  js-bower = gulp.src main-bower-files! .pipe gulp-filter \**/*.js .pipe gulp-replace /(\.\.\/)?\/themes\/default\/assets/g \.
  js-app = gulp.src paths.js
  # get ls files in app and convert them to js
  ls-app = gulp.src(paths.ls).pipe gulp-livescript {+bare}
  streamqueue {+objectMode}
    .done js-bower, js-app, ls-app
    .pipe gulp-concat \app.js
    .pipe gulp.dest paths.build
    .pipe livereload!

# task: "res"
gulp.task \res ->
  gulp.src paths.res
    .pipe gulp.dest paths.build+\/res
    .pipe livereload!
  gulp.src \bower_components/semantic-ui/dist/themes/default/assets/fonts/*
    .pipe gulp.dest paths.build+\/fonts

# task: "server" => run an express server to show the result
gulp.task \server ->
  require! \express
  express-server = express! # create an express server
  express-server.use require(\connect-livereload)! # connect livereload server
  express-server.use express.static paths.build # let express serve static files
  express-server.listen port # let express listen the request from #port 
  gulp-util.log "Listening on port: #port"

# task: "watch" => watch the change in files
gulp.task \watch <[build server]> ->
  tiny-lr-server.listen tiny-lr-port, -> # start a livereload server
    return gulp-util.log it if it
  gulp.watch [paths.html,paths.jade], <[html]> # if a change in html, jade file => execute task "html"
  gulp.watch [paths.css,paths.styl], <[css]>
  gulp.watch [paths.js,paths.ls], <[js]>
  gulp.watch [paths.res], <[res]>

gulp.task \build <[html css js res]>
gulp.task \default <[watch]>

# vi:et:ft=ls:nowrap:sw=2:ts=2
