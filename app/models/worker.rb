class Worker < ActiveRecord::Base
  belongs_to :departament
  accepts_nested_attributes_for :departament

  has_many :project_worker_relations, dependent: :destroy
  accepts_nested_attributes_for :project_worker_relations,
  reject_if: proc { |attrs| attrs[:project_id].blank? }, allow_destroy: true

  has_many :projects, through: :project_worker_relations


  validates :fn, :ln, :passport_num, :passport_ser, :birthday,
    :departament, presence: true
  validates :passport_ser, uniqueness: { scope: :passport_num,
      message: "уже есть такая комбинация номер-серия"}
  validates :passport_num, :passport_ser, length: { minimum: 4 },
    allow_blank: true
  validates :ln, length: { minimum: 2 },
    allow_blank: true

  def initials
    return (fn.first + "\." + sn.first + "\." + ln)
  end

  def self.attributes_names
    self.new.attributes.keys - ['created_at', 'updated_at']
  end
end
