# create package.json
npm init

# install the modules listed in package.json
npm i / npm install (alias)

# install the new modules you want
npm i --save [module-name]
npm i --dev-save [module-name] # detailed described when we teach gulp 

# require modules in your program
e.g.
fs = require('fs'); # fs is a built-in module, so you don't need to install it 
