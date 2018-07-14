var express = require('express');//this will came through node_module
var path = require('path'); //this will bring system module ,this will help work with file system path
var bodyParser = require('body-parser');
// this module is required to work with CORS
var cors = require('cors');

//now need route file 
var index = require('./routes/index');//index page
var tasks = require('./routes/tasks');// api work with mongoDB
var login = require('./routes/login');
var port = 3000;

var app = express();//main app
// set this so that your API understand and process request from different domain and port
app.use(cors());

//Body Parser middle ware
//This parses the body portion of an incomming HTTP request and make it easier to extract diffrebt part of the contained information
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));

//use route file
app.use('/',index);//intract with index.html, url http://3000
app.use('/api',tasks);//intract with DB the url will be http://3000/api
app.use('/login', login);


app.listen(port, function () {
	console.log('Express app listening on port 3000 ');
})