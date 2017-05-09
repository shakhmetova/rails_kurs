class Worker < ActiveRecord::Base
  belongs_to :departament
  has_and_belongs_to_many :projects


  validates :fn, :ln, :passport_num, :passport_ser, :birthday,
    :departament_id, presence: true
  validates :passport_ser, uniqueness: { scope: :passport_num,
      message: "уже есть такая комбинация номер-серия"}
  validates :passport_num, :passport_ser, length: { minimum: 4 },
    allow_blank: true
  validates :ln, length: { minimum: 2 },
    allow_blank: true
end
