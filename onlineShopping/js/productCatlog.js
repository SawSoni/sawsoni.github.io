

$(document).ready(function(){

var panel = $('#section_content_panel');

   function toggalNavPanel(){
	   	// var panel = $('#section_content_panel');
	   	// var navArrow = $('#downarrow');
	   	var panel = document.getElementById('section_content_panel');
		var navArrow = document.getElementById("downarrow");
	   	var maxH = '400px';
	   	if(panel.style.height == maxH){
	   		panel.style.height = '0px';
	   		navArrow.innerHTML = "&#9662;";
	   	}else {
	   		panel.style.height = maxH;
			navArrow.innerHTML = "&#9652;";
	   	}
   }
$('#womwnTab').on('click',toggalNavPanel);
// will get products from REST Api and pass to this function
	createDivOfProducts(products);


});
var prd1 = {id:1, name:"xxxx", price:2200, description:"xxxxxxx"};
var products = [prd1,prd1,prd1,prd1,prd1]

/**
* create div of products
*/
function createDivOfProducts(products){

	var divs = "";
	products.forEach( (product) => {
	var prd = `<div class="product">
					<div class="figureDivContainer">
						<figure class="productImg">
							<div class="wishIconDiv">
								<span class="wish tool-tip">Add To Wishlist</span>
								<span><i class="fa fa-heart icon"></i></span>
								
							</div>
							
	 						<img src="image/girl-dress.jpg" height="400px" alt="img">
	 						<div class="quickViewContainer">
								<div class="quick-view">
									<p>Quick view</p>
									<a href="#" class="product-link"></a>
								</div>
								
							</div>	
						</figure>
					</div>
				
					<div class="product-info">
						<span class="new">New</span>
						<!-- <i class="fas fa-shipping-fast"></i> -->
						<button type="button" class="infoBtn">
							<span class="wish bagSpan tool-tip"> Add To Bag </span>
							<i class="fa fa-shopping-bag icon"></i>

						</button>
						<div class="dress-information">
							<span>Band Collar 3/4Th Sleeves Embroidered dress</span>
						</div>
						<div class="price">
							<span>2000</span>
						</div>
						<div class="size">
							<span>size-label</span>
							<span>M</span>
						</div>
					</div>

		</div>`;
			divs = divs + prd;	

	} );


	$('#productContainer').html(divs);

}

// function getProduct(product){
// 	var column = `<div style="flex: 1 0 20%; border: 1px solid red; margin-right:20px">
// 					<div class="figureDivContainer">
// 						<figure class="">
// 							<div><span>wishlisticon</span></div>
// 							<div>
// 								<div>
// 									<p>Quick view</p>
// 								</div>
// 							</div>
// 	 						<img src="image/girl-dress.jpg" height="400px" alt="img">	
// 						</figure>
// 					</div>
				
// 					<div class="product-info">
// 						<span>New</span>
// 						<button type="button">btn</button>
// 						<div>
// 							<span>Band Collar 3/4Th Sleeves Embroidered dress</span>
// 						</div>
// 						<div>
// 							<span>2000</span>
// 						</div>
// 						<div>
// 							<span>size-label</span>
// 							<span>M</span>
// 						</div>
// 					</div>
// 				</div>`;

// 			return var row = `<div> ${column} ${column} ${column} </div>`;	
// }

