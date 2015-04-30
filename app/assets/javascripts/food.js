$(document).ready(function(){

    var input = $('.form-control');

    input.keypress(function(){
        var food = input.val();
        $.get("/foods?food_search="+food, function(data){
        input.typeahead({ source: data });
        })
    });
})


