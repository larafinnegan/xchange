class CreateJoinTableSearchSkill < ActiveRecord::Migration
  def change
    create_join_table :searches, :skills do |t|
      t.index :search_id
      t.index :skill_id
    end
  end
end
