ids = []
$('.project-id input').each( ->
  value = $(this).val()
  if !!value
    ids.push(+value) )
id = "<%= @project.id %>"
# console.log("массив:" + ids)
# console.log("id:" + id)
# console.log("ids.includes(+id) ? :" + ids.includes(+id))
if ! ids.includes(+id)
# console.log(id)
  name         = "<%= @project.name %>"
  date_start   = "<%= @project.date_start %>"
  date_finish  = "<%= @project.date_finish %>"
  price        = "<%= @project.price %>"

  $('#project' + id + ' .project-id input').val( id )
  $('#project' + id + ' .project-name input').val( name )
  $('#project' + id + ' .project-date_start input').val( date_start )
  $('#project' + id + ' .project-date_finish input').val( date_finish )
  $('#project' + id + ' .project-price input').val( price )

console.log("Удача! это сообщение - конечный приемник")
