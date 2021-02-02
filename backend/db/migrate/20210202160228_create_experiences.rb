class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :titre_poste, null: false
      t.text :description, null: false
      t.boolean :poste_actuel, default: true
      t.string :type_poste, null: false
      t.string :nom_societe
      t.string :localisation, null: false
      t.date :debut_occupation_poste, null: false
      t.date :fin_occupation_poste
      t.belongs_to :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
