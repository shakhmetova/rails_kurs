class CreateJoinTableProjectsWorkers < ActiveRecord::Migration
  def change
    create_join_table :projects, :workers do |t|
      t.index [:project_id, :worker_id], unique: true
      # t.index [:worker_id, :project_id]
    end
  end
end
