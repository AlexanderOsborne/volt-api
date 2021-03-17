class CreateProgramEquipments < ActiveRecord::Migration[5.2]
  def change
    create_table :program_equipments do |t|
      t.references :program, foreign_key: true
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
