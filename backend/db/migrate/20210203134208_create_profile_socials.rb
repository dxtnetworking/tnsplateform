class CreateProfileSocials < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_socials do |t|
      t.string :lien_profile
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :reseau_social, null: false, foreign_key: true

      t.timestamps
    end
  end
end
