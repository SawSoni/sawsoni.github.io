var express = require('express');//this will came through node_module
var path = require('path'); //this will bring system module ,this will help work with file system path
var bodyParser = require('body-parser');


var app = express();//main app

//View engine let system know what folder we want to use for view

app.set('views',path.join(__dirname,'views'));// folder name is view
app.set('view engine','ejs');//spacify the engine ,we want to use ejs
app.engine('html',require('ejs').renderFile)//want to render html extention file

//set static folder(put all angular staf)
app.use(express.static(path.join(__dirname,'client')));

//Body Parser middle ware
//This parses the body portion of an incomming HTTP request and make it easier to extract diffrebt part of the contained information
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));


app.listen(port, function () {
	console.log('Express app listening on port 3000 ');
})