class CreateJoinTableHabilitesExtraProProfile < ActiveRecord::Migration[6.0]
  def change
    create_join_table :habilites_extra_pros, :profiles do |t|
      t.index [:habilites_extra_pro_id, :profile_id], name: 'index_habilites_profiles_on_habilites_id_and_profile_id'
      t.index [:profile_id, :habilites_extra_pro_id], name: 'index_profiles_habilites_on_habilites_id_and_profile_id'
    end
  end
end


