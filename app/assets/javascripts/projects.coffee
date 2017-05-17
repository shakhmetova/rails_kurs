datepicker_activation_by_item = (item)->
  item.find('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})

fill_project_fields= (e, item) ->
  id = $("#project_workers").val()
  form_id = 'worker' + id
  item.attr('id', form_id)
  if id
    $.ajax
      url: '/worker_fields',
      type: 'POST',
      dataType: 'script',
      data: {
        worker_id: id
      },
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("AJAX DONE!")
  else
    console.log('ajax не понадобился - форма пустая')

$(document).on 'turbolinks:load', ->
  $('#workers').on 'cocoon:after-insert', (e, item) ->
    datepicker_activation_by_item(item)
    fill_project_fields(e, item)
