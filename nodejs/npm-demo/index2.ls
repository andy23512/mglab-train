#!/usr/bin/lsc
require! <[fs sh async]> # var [module_name] = require('[module_name]');
switch process.argv[2]
| \fs =>
  fs.write-file \output 'hello world' (err) ->
    throw err if err
    console.log \Saved!
    content = fs.read-file-sync \output encoding: \utf-8
    console.log "File content: #content"
    console.log 'I am blocked!'
  console.log 'When will I printed?'
| \sh =>
  sh('/bin/ls -1').result ->
    console.log it
| \async =>
  a = [to 5] # default start from 0: [0 to 5]
  async.each-series a, (item, callback) ->
    set-timeout (->
      console.log "Count: #item"
      callback! # no-parameter function call
    ), 1000
  , ->
    console.log \Done!
| _ =>
  console.log 'Nothing here...'


# vi:et:sw=2:sts=2
