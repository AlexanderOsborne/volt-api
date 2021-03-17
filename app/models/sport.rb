class Sport < ApplicationRecord
  validates_presence_of :name
  has_many :sport_programs
  has_many :programs, through: :sport_programs
end
