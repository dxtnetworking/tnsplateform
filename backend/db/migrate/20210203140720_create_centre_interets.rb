class CreateCentreInterets < ActiveRecord::Migration[6.0]
  def change
    create_table :centre_interets do |t|
      t.string :nom
      t.has_and_belongs_to_many :profile

      t.timestamps
    end
  end
end
