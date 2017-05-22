datepicker_activation_by_item = (item)->
  item.find('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})

fill_project_fields = ->
  $('select[id$=worker_id]').on 'change', (e) ->
    currentWorker = $(this).find('option:selected').val()
    name = $(this).attr('name').match(/attributes]\[(\d+)\]/)
    timestamp = name[name.length - 1]
    $.ajax
      url: '/worker_fields'
      type: 'POST'
      dataType: 'script'
      data: { worker_id: currentWorker, timestamp: timestamp }

$(document).on 'turbolinks:load', ->
  fill_project_fields();
  $('#workers').on 'cocoon:after-insert', (event, item) ->
    $('select[id$=worker_id]').off('change')
    datepicker_activation_by_item(item)
    fill_project_fields()
