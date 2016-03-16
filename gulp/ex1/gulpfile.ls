require! <[gulp sh]>

paths = # some important path (option)
  perl: \./sample.pl

# define task: perl
gulp.task \perl ->
  # here is the content of "perl"
  sh paths.perl .result (result) -> # execute perl program
    console.log result # print the result

# define task: watch (deps: <[build]>)
# "build" will be executed right before "watch"!!!
gulp.task \watch <[build]> ->
  # here is the content of "watch"
  gulp.watch [paths.perl], <[perl]>

# "perl" will be executed right before "build"!!!
# "build" is an empty task
gulp.task \build <[perl]>

# default task when there is no parameter
gulp.task \default <[watch]>

# vi:et:ft=ls:nowrap:sw=2:ts=2
