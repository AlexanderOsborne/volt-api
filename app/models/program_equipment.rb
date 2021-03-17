class ProgramEquipment < ApplicationRecord
  belongs_to :program
  belongs_to :equipment
end
