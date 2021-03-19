class WorkoutSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :sport, :required_equipment
  set_type :program
end
