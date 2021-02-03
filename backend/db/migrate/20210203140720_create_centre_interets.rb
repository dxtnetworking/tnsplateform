class CreateCentreInterets < ActiveRecord::Migration[6.0]
  def change
    create_table :centre_interets do |t|
      t.string :nom, null: false

      t.timestamps
    end
  end
end
