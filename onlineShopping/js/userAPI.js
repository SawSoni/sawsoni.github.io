const UserAPI = (function(){

    var URL = null;

    /**
     * 
     * @param {*} url 
     */
    function setUrl(url){
        URL = url;
    }

    /**
     * validate url
     */
    function validate(){
       
        if(URL == null || URL == undefined || URL === ""){
            throw new Error("URL is null. Please call setUrl(url) function before calling any other function");
        }
        
    }

   /* *
     * this will return me a promise object 
   */
     function getUsers(){
        validate();
       return $.ajax({
            url:URL
        });
     }

     /* *
      * this will return a promise object with User name 
     */
     function getUser(name){
        validate();
         var urlWithName = URL + "/" +name;
         return $.ajax({
            url:urlWithName,
            method:GET
         })
     }

     /* *
        * This will create a User 
      */

      function createUser(user){
        validate();
        if(typeof(user) == "object" ){

            return $.ajax({
                method: "POST",
                url: URL,
                data: product
            })
        }
        
      }

    return{
        setUrl,
        getUsers,
        getUser,
        createUser
    }
})();