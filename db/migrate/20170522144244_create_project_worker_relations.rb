class CreateProjectWorkerRelations < ActiveRecord::Migration
  def change
    create_table :project_worker_relations do |t|
      t.references :project, index: true, foreign_key: true, null: false
      t.references :worker, index: true, foreign_key: true, null: false
      t.index [:project_id, :worker_id], unique: true

      t.timestamps null: false
    end
  end
end
