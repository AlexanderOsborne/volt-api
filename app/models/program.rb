class Program < ApplicationRecord
  validates_presence_of :name
  has_many :sport_programs, dependent: :destroy
  has_many :program_equipments, dependent: :destroy
  has_many :equipments, through: :program_equipments
end
