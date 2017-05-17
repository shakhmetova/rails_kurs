departament_selector_handler = (e) ->
  $.ajax
    url: '/departament_fields',
    type: 'POST',
    dataType: 'script',
    data: {
      departament_id: +$(this).val()
    },
    error: (jqXHR, textStatus, errorThrown) ->
      console.log("AJAX Error: #{textStatus}")
    success: (data, textStatus, jqXHR) ->
      console.log("AJAX DONE!")

$(document).on 'turbolinks:load', ->
  $('#select_existing_departament').on 'change', departament_selector_handler
