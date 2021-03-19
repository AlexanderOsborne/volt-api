class ProgramsEquipment < ApplicationRecord
  belongs_to :program
  belongs_to :equipment
end
