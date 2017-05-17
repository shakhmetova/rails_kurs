condition = ('<%= @departament.nil? %>' == 'true')
if condition
  $('#worker_departament_attributes_id').val('')
  $('#worker_departament_attributes_name').val('')
else
  $('#worker_departament_attributes_id').val('<%= @departament.try(:id) %>')
  $('#worker_departament_attributes_name').val('<%= @departament.try(:name) %>')
console.log('отработал')
