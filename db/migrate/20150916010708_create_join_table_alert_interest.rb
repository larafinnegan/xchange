class CreateJoinTableAlertInterest < ActiveRecord::Migration

  def change
    create_join_table :alerts, :interests do |t|
      t.index :alert_id
      t.index :interest_id
    end
  end
end
