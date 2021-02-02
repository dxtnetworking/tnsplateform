class CreateTelephones < ActiveRecord::Migration[6.0]
  def change
    create_table :telephones do |t|
      t.boolean :numero_principal, default: false
      t.string :numero, null: false
      t.belongs_to :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
