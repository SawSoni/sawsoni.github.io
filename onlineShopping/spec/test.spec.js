describe("Test", function(){

    it("should test something ", function(){
        expect(true).toBe(true);
        expect(10*2).toBe(20);
    })

    it("should test object ", ()=> {
        var person = {name:"Naresh",age:40};

        // positive testing
        expect(person.name).toBe("Naresh");
        expect(person.age).toBe(40);
        // negative testing
        expect(person.age).not.toBe(41);
    })

    
})