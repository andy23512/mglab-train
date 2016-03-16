#!/usr/bin/node
// how to show things to console/terminal
console.log('hello world');

// single line comment
/*
  multi-line comment
*/

// variables: declaration is a good habit, but js don't care it :P
var a = 5; // integer
var b = 10.0; // floating point number
var c = 'abc'; // string
var d = ['a', 'b', 'c']; // array
//console.log(d);
//console.log(d.length);
//console.log(d[0]);
var e = { // object, like hash in Perl
	a: 1,
	b: 2,
	c: 3
};
//console.log(e); 
//console.log(e.a); // use dot notation to get value from an object 

// opertors
var e = (5 == a)?'a is 5':'a is not 5'; //ternary operator
// basic +-*/ of course.


// condition: if, else if, else, switch
// it's exactly same as c or java
// if([condition]){
//		...
// }
// else if([condition]){
// 		...
// }
// else([condition]){
//		...
// }
// swicth([variable]){
//		case [value]:
//			...
//			break;
//		...
//		default:
//			...
//			break; # well, this break can be deleted
// }  // condition: equal: 1 == != '1' 1 === !== '1'

// loop: for, while, do while
// to save some time, so google for the syntax if you would 

// function
// this is how a function is defined in js
function add(a, b){
	return a+b;
}
// this is how we call a function
add(10, 15); // => 25

// Important: anonymous function
// some function may take a function as a paramter
// and they are lazy to give each function a name...
// so ..., it's really common to see this in a js program
setTimeout(function(){
	// console.log('Print after 1 sec')
}, 1000);

//Important:non-blocking, happen when there is a callback function
//(callback function is usually something to execute after some action)
// Guess the output of the program below!!!
for(var i=1;i<=10;++i){
	setTimeout(function(){
		console.log(i)
	}, 1000);	
}
// js would not wait for time and I/O!

//Event driven, we will tell that in web service

// vi:sw=4:ts=4
