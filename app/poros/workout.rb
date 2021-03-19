class Workout
  attr_reader :id,
              :name,
              :sport,
              :required_equipment

  def initialize(program, sport, equipment)
    @id = program["id"]
    @name = program["name"]
    @sport = WorkoutSport.new(sport)
    @required_equipment = equipment.each {|item| RequiredEquipment.new(item)}
    # require 'pry'; binding.pry
  end
end