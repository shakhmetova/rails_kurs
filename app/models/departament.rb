class Departament < ActiveRecord::Base
  has_many :workers

  validates :name, presence: true, uniqueness: true
end
