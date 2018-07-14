$(document).ready(function(){
	console.log("document is ready ");

	/**
	* An eventlister on calculator
	* The event is click
	**/

	$('#add').on('click', function(){
		var x = $('#x').val();
		var y = $('#y').val();
		var result = $('#result');
		result.html(add(x, y));
	})

	
	

	$('#sub').on('click', function(){
		var x = $('#x').val();
		var y = $('#y').val();
		var diffresult = $('#diffResult');
		var result = diff(x , y);
		diffresult.html( result );
	
	})

	$('#multi').on('click', function(){
		var x = $('#x').val();
		var y = $('#y').val();
		var multiSpan = $('#multiplyResult');
		var result = multiply(x, y);
		multiSpan.html(result);


	});

	/**
	 	This function add and return result of two params x and y
	*/
	function add(x, y){
		return parseInt(x) + parseInt(y);
	}

	/**
		This function substract and return result of x and y
	*/
	function diff(x, y){
		return parseInt(x) - parseInt(y);
	}

	/*
		This function is multiply and result of x and y
	*/ 

	function multiply(x, y) {
		return parseInt(x) * parseInt(y);
	}

			
})



