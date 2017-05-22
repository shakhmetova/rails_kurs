ids = []
$('.project-id input').each( ->
  value = $(this).val()
  if !!value
    ids.push(+value) )

id = "<%= @project.try(:id) %>"
firstProject = !ids.includes(+id)

timestamp = "<%= @timestamp %>"
project = ("<%= @project.nil? %>" == 'false')
selectorPrefix = "#worker_project_worker_relations_attributes_"

if project && firstProject
  name         = "<%= @project.try(:name) %>"
  date_start   = "<%= @project.try(:date_start) %>"
  date_finish  = "<%= @project.try(:date_finish) %>"
  price        = "<%= @project.try(:price) %>"
else
  if !firstProject
    $(selectorPrefix + timestamp + '_project_id').val(0)
  id           = ""
  name         = ""
  date_start   = ""
  date_finish  = ""
  price        = ""

$(selectorPrefix + timestamp + '_project_attributes_id').val( id )
$(selectorPrefix + timestamp + '_project_attributes_name').val( name )
$(selectorPrefix + timestamp + '_project_attributes_date_start').val( date_start )
$(selectorPrefix + timestamp + '_project_attributes_date_finish').val( date_finish )
$(selectorPrefix + timestamp + '_project_attributes_price').val( price )
