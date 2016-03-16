#!/usr/bin/node
var fs = require('fs');
var sh = require('sh');
var async = require('async');

// one can follow the readme or tutorial of each module to do what you want
// following are some simple demo
console.log(process.argv);
switch(process.argv[2]){ // get arg from command
	case 'fs':
		fs.writeFile('output', 'hello world', function(err){
			// These code are executed after the file is written
			if(err) throw(err);
			console.log('Saved!');
			content = fs.readFileSync('output', {encoding:'utf-8'});
			console.log('File content: ' + content); 
			console.log('I am blocked!');
		});
		console.log('When will I printed?');
		break;
	case 'sh':
		sh('/bin/ls -1').result(function(result){
			console.log(result);
		});
		break;
	case 'async':
		// remember the non-blocking for loop?
		var a = [0,1,2,3,4,5];
		async.eachSeries(a, function iterator(item,callback){
			setTimeout(function(){
				console.log('Count: ' + item); // item is each entry
				callback(); // call callback to execute next item!
			},1000); // never believe this time...
		},function done(){ // when all items are processed, this will be called
			console.log('Done!');
		});
		break;
	default:
		console.log('Nothing here...');
}
