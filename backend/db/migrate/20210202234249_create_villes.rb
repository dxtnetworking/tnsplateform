class CreateVilles < ActiveRecord::Migration[6.0]
  def change
    create_table :villes do |t|
      t.string :nom, null: false
      t.belongs_to :pay, null: false, foreign_key: true

      t.timestamps
    end
  end
end
