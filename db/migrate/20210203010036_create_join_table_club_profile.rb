class CreateJoinTableClubProfile < ActiveRecord::Migration[6.0]
  def change
    create_join_table :clubs, :profiles do |t|
      t.index [:club_id, :profile_id]
      t.index [:profile_id, :club_id]
    end
  end
end
