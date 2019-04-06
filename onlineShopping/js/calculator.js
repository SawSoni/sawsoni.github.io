var Calculator = ( function() {

    function add(n1, n2){
        return n1 + n2;
    }

    function sub(n1,n2){
        return n1 - n2;
    }

    function multiply(n1,n2){
        return n1 * n2; 
    }

    function division(n1,n2){
        return n1 / n2;
    }

    return {
        add,
        sub,
        multiply,
        division
    }
})();