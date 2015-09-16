class DropJoinTable < ActiveRecord::Migration
  def change
    drop_table :individuals_interests
  end
end
