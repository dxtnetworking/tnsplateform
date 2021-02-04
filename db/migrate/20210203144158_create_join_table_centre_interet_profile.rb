class CreateJoinTableCentreInteretProfile < ActiveRecord::Migration[6.0]
  def change
    create_join_table :centre_interets, :profiles do |t|
      t.index [:centre_interet_id, :profile_id], name: 'index_interets_profiles_on_interet_id_and_profile_id'
      t.index [:profile_id, :centre_interet_id], name: 'index_profiles_interets_on_interet_id_and_profile_id' 
    end
  end
end




