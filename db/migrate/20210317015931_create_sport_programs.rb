class CreateSportPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :sports_programs do |t|
      t.references :sport, foreign_key: true
      t.references :program, foreign_key: true

      t.timestamps
    end
  end
end
