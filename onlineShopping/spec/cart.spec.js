/**
 * Test cases for Cart API
 */
describe("Cart", function() {


    it("should be globally available, and not null  ", function() {
        expect(Cart).not.toBe(undefined);
    })

    it("should have intially 0 products", function() {
        expect(Cart.getProducts().length).toBe(0);
    })

    it("should be able to add a product", function() {
        var prd = {name:"Jeans"};
        Cart.addProduct(prd);
        expect(Cart.getProducts().length).toBe(1);

        // again add, now it should have 2 products
        Cart.addProduct(prd);
        expect(Cart.getProducts().length).toBe(2);
    })

    it("should be able to find a product", function() {
        // first few products
        var prd = {name:"Jeans"};
        Cart.addProduct(prd);

        prd = {name:"T-shirt"};
        Cart.addProduct(prd);

        // now search with name - T-shirt, I should get a product
        var foundProduct = Cart.findProductByName("T-shirt");
        expect(foundProduct).not.toBe(undefined);
        expect(foundProduct.name).toBe("T-shirt");

         // search by non existence name like watch
         foundProduct = Cart.findProductByName("watch");
         expect(foundProduct).toBe(undefined);
       
    })


})