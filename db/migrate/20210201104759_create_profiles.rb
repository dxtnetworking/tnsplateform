class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :adresse
      t.string :niveau_etude
      t.string :profession
      t.string :occupation_actuelle
      t.text :attentes_networking
      t.boolean :membre_equipe_pilote, default: false
      t.string :statut, limit: 10
      t.date :date_adhesion
      t.date :date_resiliation
      t.text :motif_resiliation
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
