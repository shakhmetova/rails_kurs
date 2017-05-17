ids = []
$('.worker-id input').each( ->
  value = $(this).val()
  if !!value
    ids.push(+value) )
id = "<%= @worker.id %>"
if ! ids.includes(+id)
  fn           = "<%= @worker.fn %>"
  ln           = "<%= @worker.ln %>"
  sn           = "<%= @worker.sn %>"
  passport_num = "<%= @worker.passport_num %>"
  passport_ser = "<%= @worker.passport_ser %>"
  birthday     = "<%= @worker.birthday %>"
  post         = "<%= @worker.post %>"
  console.log(post)

  $('#worker' + id + ' .worker-id input').val( id )
  $('#worker' + id + ' .worker-fn input').val( fn )
  $('#worker' + id + ' .worker-ln input').val( ln )
  $('#worker' + id + ' .worker-sn input').val( sn )
  $('#worker' + id + ' .worker-passport_num input').val( passport_num )
  $('#worker' + id + ' .worker-passport_ser input').val( passport_ser )
  $('#worker' + id + ' .worker-birthday input').val( birthday )
  $('#worker' + id + ' .worker-post input').val( post )

console.log("Удача! это сообщение - конечный приемник")
