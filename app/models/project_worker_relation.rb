class ProjectWorkerRelation < ActiveRecord::Base
  belongs_to :project
  belongs_to :worker
  accepts_nested_attributes_for :project
  accepts_nested_attributes_for :worker

  validates :project_id, uniqueness: { scope: :worker_id,
    message: 'Такой проект уже связан с таким работником'}
end
