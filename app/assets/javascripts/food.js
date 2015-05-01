$(document).ready(function(){


    var earn_it = $('#earn-it-now');
    earn_it.click(function(event) {
      event.preventDefault();
      var splurge_food = $('#splurge').val();
      $.ajax({
        url: '/food_searches.json',
        data: { food_search: splurge_food },
        success: function(results) {
          results.forEach(function(result) {
            $("#results-list").append("<li class='nameOfClass for styling'>" + result.table.brand  + ': ' + result.table.name + '</li>');
            
          });
          // list needs to populate a dropdown menu
          // a user selects an element from the dropdown and 
          // upon selecting a food, the weight and submit box appears
          // user enters his weight
          // $(earn_it).hide(); 
        }
      });


      });
    // input.keypress(function(){
    //     var food = input.val();
    //     $.get("/foods?food_search="+food, function(data){
    //     input.typeahead({ source: data });
    //     })
    // });
})


