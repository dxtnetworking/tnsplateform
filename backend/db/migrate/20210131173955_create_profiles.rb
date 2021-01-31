class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :adresse
      t.string :niveau_etude
      t.string :occupation_actuelle
      t.text :attentes_networking
      t.boolean :membre_equipe_pilote
      t.string :statut
      t.date :date_adhesion
      t.date :date_resiliation
      t.text :motif_resiliation

      t.timestamps
    end
  end
end
