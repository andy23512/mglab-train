$ document .ready ->
  $ \button .click ->
    $ @ .html \Pushed!
    $ \#show .html \output .css \color \purple
    $ \#ani .animate {width: \50px, height: \50px}, 1000
    # $ \button .click!

# vi:et:nowrap:sw=2:ts=2
