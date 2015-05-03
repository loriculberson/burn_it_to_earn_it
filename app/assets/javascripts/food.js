$(document).ready(function(){
  
  $('#splurge').typeahead({
    source: function(splurgeFood, processCallback){
      $.ajax({
          url: '/food_searches.json',
          data: {food_search: splurgeFood},
          success: function(results){
            results.forEach(function(result){
              result.name = result.table.name
            })
            processCallback(results);  
          }
      })
    }
  });

  /*
    var earn_it = $('#find-food');
    earn_it.click(function(event) {
      event.preventDefault();
      var splurge_food = $('#splurge').val();
      $.ajax({
        url: '/food_searches.json',
        data: { food_search: splurge_food },
        success: function(results) {
          results.forEach(function(result) {
            $("#results-list").append("<li class='nameOfClass for styling'>" + result.table.brand  + " " + result.table.name + " " + result.table.calories +"</li>");
            
          });
          // list needs to populate a dropdown menu

          // a user selects an element from the dropdown and 
          // upon selecting a food, the weight box and submit button appears
          // user enters his weight, clicks submit
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
*/
})





