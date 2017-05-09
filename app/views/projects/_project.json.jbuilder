json.extract! project, :id, :name, :date_start, :date_finish, :price, :created_at, :updated_at
json.url project_url(project, format: :json)
