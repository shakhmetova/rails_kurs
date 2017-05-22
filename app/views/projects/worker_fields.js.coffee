ids = []
$('.worker-id input').each( ->
  value = $(this).val()
  if !!value
    ids.push(+value) )

id = "<%= @worker.try(:id) %>"
firstWorker = !ids.includes(+id)
timestamp = "<%= @timestamp %>"
worker = ("<%= @worker.nil? %>" == 'false')
selectorPrefix = "#project_project_worker_relations_attributes_"

if worker && firstWorker
  fn           = "<%= @worker.try(:fn) %>"
  ln           = "<%= @worker.try(:ln) %>"
  sn           = "<%= @worker.try(:sn) %>"
  passport_num = "<%= @worker.try(:passport_num) %>"
  passport_ser = "<%= @worker.try(:passport_ser) %>"
  birthday     = "<%= @worker.try(:birthday) %>"
  post         = "<%= @worker.try(:post) %>"
else
  if !firstWorker
    $(selectorPrefix + timestamp + '_worker_id').val(0)
  fn           = ""
  ln           = ""
  sn           = ""
  passport_num = ""
  passport_ser = ""
  birthday     = ""
  post         = ""

$(selectorPrefix + timestamp + '_worker_attributes_id').val( id )
$(selectorPrefix + timestamp + '_worker_attributes_fn').val( fn )
$(selectorPrefix + timestamp + '_worker_attributes_ln').val( ln )
$(selectorPrefix + timestamp + '_worker_attributes_sn').val( sn )
$(selectorPrefix + timestamp + '_worker_attributes_passport_num').val( passport_num )
$(selectorPrefix + timestamp + '_worker_attributes_passport_ser').val( passport_ser )
$(selectorPrefix + timestamp + '_worker_attributes_birthday').val( birthday )
$(selectorPrefix + timestamp + '_worker_attributes_post').val( post )
