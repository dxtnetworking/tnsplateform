class CreatePays < ActiveRecord::Migration[6.0]
  def change
    create_table :pays do |t|
      t.string :nom
      t.string :code_iso

      t.timestamps
    end
  end
end
