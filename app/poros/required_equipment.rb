class RequiredEquipment
  attr_reader :name,
              :id
              
  def initialize(equipment)
    @name = equipment["name"]
    @id = equipment["id"]
  end
end