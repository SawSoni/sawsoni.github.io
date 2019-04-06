var Cart = (function(){
    /* This is a iife function */

    /* Hold product in cart */
    var productIncart  =  [];


    /**
    * add product in a cart 
    * @param {} product
    */

    function addTocart(pro){
        productIncart.push(pro);
    }

    function  getProduct(){
        return productIncart;
    }





    return {
        addTocart,
        getProduct
        }
})();

var pro1 =  Cart.addTocart('T-shirt');
console.log(pro1);