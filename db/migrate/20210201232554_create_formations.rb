class CreateFormations < ActiveRecord::Migration[6.0]
  def change
    create_table :formations do |t|
      t.string :intitule, null: false
      t.string :niveau, null: false
      t.string :specialisation
      t.string :nom_institution, null: false
      t.string :localisation, null: false
      t.date :debut_formation, null: false
      t.date :fin_formation
      t.belongs_to :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
