var print=function(ar){
    var x=0;
    function increase(){
         x=(x+1)%ar.length;
        return ar[x];
    }
    function decrease(){
         x=(x+ar.length-1)%ar.length;
        return ar[x];
    }
    return {increase,decrease};
}