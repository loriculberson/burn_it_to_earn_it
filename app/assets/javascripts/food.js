$(document).ready(function(){
  
  $('#scrollable-dropdown-menu').typeahead({

      items: 'all',
      minLength: 3,
      scrollHeight: 4,
      
    source: function(splurgeFood, processCallback){
      $.ajax({
          url: '/foods.json',
          data: {food_search: splurgeFood},

          success: function(results){
            results.forEach(function(result){
              result.name =  result.name + ' | Calories: ' + result.calories + ' ' 
            })
            processCallback(results);  
            // #function to tell typeahead what the results are
          }
      })
    },
    afterSelect: function(panda){
      $('#find-food').removeAttr('disabled');
    }
  });
})


