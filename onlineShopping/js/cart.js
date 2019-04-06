var Cart = (function(){

    // holds products in the cart
    var _productsInCart = [];

    /**
     * add product in the cart
     * @param {} product 
     */
    function addToCart(product){
        _productsInCart.push(product);
    }

    /**
     * get products in the cart
     */
    function getProducts(){
        return _productsInCart;
    }

    /**
     * find a product
     */
    function findProductByName(productName){
        return _productsInCart.find( function(prod, index){
            return prod.name === productName;
        })

    }

    return {
        addProduct:addToCart,
        getProducts:getProducts,
        findProductByName:findProductByName
    }
})();