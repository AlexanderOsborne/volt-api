class Equipment < ApplicationRecord
  validates_presence_of :name
  has_many :programs_equipments
end
