$(document).ready(function(){
  
  $('#scrollable-dropdown-menu').typeahead({

      items: 'all',
    source: function(splurgeFood, processCallback){
      $.ajax({
          url: '/food_searches.json',
          data: {food_search: splurgeFood},
          success: function(results){
            results.forEach(function(result){
              result.name = result.table.brand + ' '+ result.table.name + ' | Calories: ' + result.table.calories + ' ' 
            })
            processCallback(results);  
            // #function to tell typehead what the results are
          }
      })
    },
    afterSelect: function(panda){
      $('#find-food').removeAttr('disabled');
    }
  });
})


