/*	1.The Element.scrollTop property gets or sets the number of pixels that an element's content is scrolled vertically.
	2.Document.documentElement returns the Element that is the root element of the document
	 (for example, the <html> element for HTML documents)
*/
window.onscroll = function() {scrollFunction()};
// The onscroll event occurs when an element's scrollbar is being scrolled.
function scrollFunction() {
	if(document.body.scrollTop > 20 || document.documentElement.scrollTop > 20){
		document.getElementById('myBtn').style.display = 'block';
	}else {
		document.getElementById('myBtn').style.display = 'none';
	}
}
/* this function will execute after clicking button*/
function topFunction(){
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}
	/* adding event listener to the button*/
	myBtn.addEventListener('click', topFunction);