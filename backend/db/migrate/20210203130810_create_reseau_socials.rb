class CreateReseauSocials < ActiveRecord::Migration[6.0]
  def change
    create_table :reseau_socials do |t|
      t.string :nom_reseau, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
