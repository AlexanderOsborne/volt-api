class Sport < ApplicationRecord
  validates_presence_of :name
  has_many :sports_programs
  has_many :programs, through: :sports_programs
end
