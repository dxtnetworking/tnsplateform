class CreateHabilitesExtraPros < ActiveRecord::Migration[6.0]
  def change
    create_table :habilites_extra_pros do |t|
      t.string :nom
      t.text :description

      t.timestamps
    end
  end
end
