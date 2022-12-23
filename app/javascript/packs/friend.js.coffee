$( document ).ready ->
  $.ajax '/search',
        type: 'GET'
        parameters: $( "#autocomplete_search" ).val()
        dataType: 'json'
        success: ( data ) ->
            #  here you'll have to append the results to whichever div/container you have in place
            $( '#autocomplete_search_results' ).append "#{ data }"
