
 document.getElementById('btnNav').addEventListener('click',function(){
 	var nav = document.getElementById('navmenu');
 	if(nav.className == 'navWrapperHide'){
 		nav.className = 'navWrapperShow';
 		
 	}else{
 		nav.className = 'navWrapperHide';
 	}

 	this.classList.toggle("change");

 	height();

 	});

 function height(){
 	var parentDiv = document.querySelector('.mainWrapper');
 	var maxH = "900px";

 	if(parentDiv.style.height == maxH){
 		parentDiv.style.height="0px";
 	}else{
 		parentDiv.style.height = maxH;
 	}

 }