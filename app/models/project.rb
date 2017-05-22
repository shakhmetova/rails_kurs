class Project < ActiveRecord::Base
  has_many :project_worker_relations, dependent: :destroy
  accepts_nested_attributes_for :project_worker_relations,
  reject_if: proc { |attrs| attrs[:worker_id].blank? }, allow_destroy: true
  has_many :workers, through: :project_worker_relations


  validates :name, :date_start, :date_finish, :price, presence: true
  validates :price, numericality: { only_integer: true,
    greater_than_or_equal_to: 0, message: "должно быть не отрицательным"}
  validates :name, uniqueness: {scope: :date_start,
    message: "Проект с таким названием уже стартовал в это время"}
  validate :validate_dates

  def validate_dates
    if date_finish && date_start
      if date_finish < date_start
        errors.add(:date_finish,
          "Дата окончания должна быть больше даты начала")
      end
    end
  end

  def self.attributes_names
    self.new.attributes.keys - ['created_at', 'updated_at']
  end
end
