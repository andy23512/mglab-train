#!/usr/bin/lsc
# livescript version of basic.js
console.log 'hello world'

# single line comment
/*
  multi-line comment
*/

# variables: when livescript is converted to js, the variables are declared automatically
a = 5
b = 10.0
c = \abc # single word string
d = <[a b c]> # string array
# console.log d
# console.log d.length
# console.log d[0]
e =
  a: 1
  b: 2
  c: 3

# console.log e
# console.log e.a

# operators
e = if (5 is a) then 'a is 5' else 'a is not 5'
# is => ===
# isnt => !==

# condition: if, else if, else, switch
# 
# if [condition]
#   ...
#   ...
# else if [condition]
#   ...
#   ...
# else [condition]
#   ...
#   ...
# switch [variable]
# | [value] =>
#   ...
#   ... # break is added when converted
# ...
# | _ => # default
#   ...
#   ...
#   ...
# 
# we would describe loop later
#
#
#
#
function add (a, b)
  a+b # return is added to the last line when converted
#
#
add 10 15 # parentheses, comma can be omitted (sometimes...)
c = 10
add c, 15 # like this, this case will cause error when you don't write the comma
# add c, 15   =>   add(c, 15)
# add c 15    =>   add(c(15))

set-timeout (-> console.log 'Print after 1 sec'), 1000
# set-timeout would be converted to setTimeout
# -> means function
#
#
#
#
for i from 1 to 10
  set-timeout (-> console.log(i)), 1000

# common loop usage
array = <[aa bb cc]>
for entry, index in array # loop an array
  console.log "#entry #index" # interpolation
obj = a: 1 b: 2 c: 3
for key, value of obj # loop an object
  console.log "#key #value"


# vi:et:sw=2:sts=2
