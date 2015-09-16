class CreateJoinTableAlertSkill < ActiveRecord::Migration
    def change
    create_join_table :alerts, :skills do |t|
      t.index :alert_id
      t.index :skill_id
    end
  end
end
