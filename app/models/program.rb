class Program < ApplicationRecord
  validates_presence_of :name
  has_many :sport_programs
  has_many :program_equipments
  has_many :equipments, through: :program_equipments


  def self.sport_programs(sport, equipment)
    require 'pry'; binding.pry
  end
end
