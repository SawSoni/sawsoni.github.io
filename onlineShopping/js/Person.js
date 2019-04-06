var Person = ( ()=> {

        var p;

        function createPerson(name, age, sex){
             p = {name:name, age:age, sex:sex};
             return p;
        }

        function addProperty(phoneNumberValue){
            p.phoneNumber = phoneNumberValue;
            return p;
        }

        return{
            createPerson,
            addProperty
        }
})();