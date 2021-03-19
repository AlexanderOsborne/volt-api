class WorkoutSport
  attr_reader :name,
              :id

  def initialize(sport)
    @name = sport[0]["name"]
    @id = sport[0]["id"]
  end
end