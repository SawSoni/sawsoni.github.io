
 
 	var btn = document.getElementById('loginBtn');
 	btn.addEventListener('click',function(e){
 		e.preventDefault();
 		var useId = document.getElementById('uName').value;
 		var password = document.getElementById('password').value;
 		var xhr = new XMLHttpRequest();

 		var obj = {
 			uId: useId,
 			password: password
 		}

 		xhr.open('POST', 'http://localhost:3000/login',true);
 		xhr.onload = function(){
 			console.log(xhr.responseText);
 			console.log('valid user');
 				resolveFunction(xhr.responseText);

 			};
 			xhr.onerror = function(){
 				rejectFunction(xhr.statusText);
 			};
 			xhr.send();
 	})