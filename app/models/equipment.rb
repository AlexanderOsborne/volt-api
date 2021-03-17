class Equipment < ApplicationRecord
  validates_presence_of :name
  has_many :program_equipments
end
