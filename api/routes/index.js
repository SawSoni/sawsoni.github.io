var express = require('express');
var router = express.Router();//from express

//set home page it will be get request

router.get('/',function(req,res,next){
	 // res.send('index page')//this will print this string
	res.render('index.html');
});

module.exports = router;