class Box {
    constructor(width, height, breadth){
        this.area = width * height;
        this.volume = width * height * breadth;
    }
    // multiple constructor not allowed
    /** 
    constructor(width,height,breadth){
        
    }
    */
}

class Box2 {

    constructor(width, height, breadth){
        this.width = width;
        this.height = height;
        this.breadth = breadth;
    }

    getArea(){
        return this.width * this.height;
    }

    getVolume(){
        return this.width * this.height * this.breadth;
    }
}

class Box3 {

    constructor(){
      this.width = 20;
      this.height = 40;
      this.b = new Box2(10,20);
    }

     getArea(){
         return this.width * this.height;
     }
}

var obj1 = new Box(20,10);
console.log("Area " + obj1.area);
console.log("Valume " + obj1.volume);
console.log("------------");
var obj2 = new Box(10,20,10);
console.log("Volume "+obj2.area);
console.log("Volume "+obj2.volume);
console.log("------Box2 object--------");
var obj3 = new Box2(10,20,30);
console.log(obj3);
console.log(obj3.getArea());

console.log("------------Box3 obj-------------");

var obj4 = new Box3();
console.log(obj4);
