

$(document).ready(function () {
	/**
	 * Get all the products in the cart and update the DOM #cart
	 * Call this function on load of the DOM so that HTML shows the products in the cart
	 */
	refreshCart();


	var panel = $('#section_content_panel');

	function toggalNavPanel() {
		// var panel = $('#section_content_panel');
		// var navArrow = $('#downarrow');
		var panel = document.getElementById('section_content_panel');
		var navArrow = document.getElementById("downarrow");
		var maxH = '400px';
		if (panel.style.height == maxH) {
			panel.style.height = '0px';
			navArrow.innerHTML = "&#9662;";
		} else {
			panel.style.height = maxH;
			navArrow.innerHTML = "&#9652;";
		}
	}
	// on click toggle nav panel
	$('#womwnTab').on('click', toggalNavPanel);

	// will get products from REST Api and pass to this function
	updateProductContainer();
});


/**
 * 
 */
function updateProductContainer(){
	var prd1 = { id: 1, name: "kurti", price: 2200, description: "xxxxxxx" };
	// this products should come from REST API of products
	var products = [prd1, prd1, prd1, prd1, prd1];
	var divs = createDivOfProducts(products);
	$('#productContainer').html(divs);
}

/**
* create div of products
*/
function createDivOfProducts(items) {
	var divs = "";
	var that = this;
	items.forEach((item) => {
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
							<span class="wish bagSpan tool-tip" onClick="addProduct('${item.name}')"> Add To Bag </span>
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
		that.divs = that.divs + prd;
		
		
	});
	return that.divs;

}

/**
 * Add Product to the Cart
 * @param {product} product 
 */
function addProduct(product) {
	Cart.addProduct(product);
	// refresh cart to update number of items in the cart
	refreshCart();
}

function refreshCart() {
	var products = Cart.getProducts();
	$('#cart').html(products.length);
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

