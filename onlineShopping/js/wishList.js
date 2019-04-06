var wishList = (function(){

   /*  
        * need wishlist product in array
    */

    var _wish_list_product = [];

    /* 
        * add product in cart array
     */
    
    
        function addToWishList(product){
            _wish_list_product.push(product);
        }

        /* 
            * Get product in wishList
         */

         function getAllWishList(){

             return _wish_list_product;
         }

         return {
            addToWishList,
            getAllWishList
         }


})();