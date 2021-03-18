class Program < ApplicationRecord
  validates_presence_of :name
  has_many :sports_programs
  has_many :sports, through: :sports_programs
  has_many :programs_equipments
  has_many :equipments, through: :programs_equipments


  def self.sport_programs(sport, equipment)
    by_equipment = joins(:equipments).joins(:sports).where('sports.name': sport).where('equipment.name IN (?)', equipment.split(","))
    by_equipment.reject {|program| program.equipments.where('name not in (?)', equipment.split(",")).first.present?}.uniq
  end
end
