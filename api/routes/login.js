var express = require('express');
var router = express.Router();//from express
var mongojs = require('mongojs');
//var db = mongojs('mongodb://sawsoni:Incorrect12!@ds045628.mlab.com:45628/tasklist_soni',['tasks']);
 var db = mongojs('mongodb://localhost:27017/soni');

router.get('/',function(req,res,next){
	db.users.find(function(err,user){
		if(err){
			res.send(err);
		}else{
			res.json(user);
		}
	})
})
//
router.post('/',function(req,res,next){
	var user = req.body;
	console.log(user);
	var uname = user.username;
	var pwd = user.password;
	
	db.users.findOne(user, function(err, user){
		console.log(user);
		if(user){
			res.json({"message":"success"});
		}else {
			res.status = 500;
			res.send({"message":"failed"})
		}
		
	})
	
});


module.exports = router;
