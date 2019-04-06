$(document).ready( function() {
    console.log("DOM is ready");

    UserAPI.setUrl("https://api.github.com/users");

    UserAPI.getUsers()
    .then ( (respo) => {
        console.log(respo);
    })
})