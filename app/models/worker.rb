class Worker < ActiveRecord::Base
  belongs_to :departament
  accepts_nested_attributes_for :departament

  has_and_belongs_to_many :projects
  accepts_nested_attributes_for :projects, allow_destroy: true,
      reject_if: :all_blank

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
end
