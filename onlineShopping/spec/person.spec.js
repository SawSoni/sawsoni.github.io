describe("Person ", () => {

it("should create a person object ", ()=>{
    var p  = Person.createPerson("Naresh", 40, "Male");

    expect(p.name).toBe("Naresh");

    // add phoneNumber
    p = Person.addProperty(9811610815);

    expect(p.phoneNumber).not.toBe(undefined);
    console.log(p);

})

})