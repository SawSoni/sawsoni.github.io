describe("Calculator", function(){

    var n1, n2;

    beforeEach(function(){
        n1 = 20;
        n2  = 10;
    })

    it("should add two numbers", function(){
        var result = Calculator.add(n1, n2);
        expect(result).toBe(30);
    })

    it("should substract two numbers", function(){
        var result1 = Calculator.sub(n1, n2);
        expect(result1).toBe(10);
    })

    it("should multiply two numbers", function(){
        var result2 = Calculator.multiply(n1,n2);
        expect(result2).toBe(200);
    })

    it("should divide two numbers", function(){
        var result3 = Calculator.division(n1, n2);
        expect(result3).toBe(2);
    })
})