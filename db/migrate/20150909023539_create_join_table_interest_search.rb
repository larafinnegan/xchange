class CreateJoinTableInterestSearch < ActiveRecord::Migration
  def change
    create_join_table :interests, :searches do |t|
      t.index :interest_id
      t.index :search_id
    end
  end
end
