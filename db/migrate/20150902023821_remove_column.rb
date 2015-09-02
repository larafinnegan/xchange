class RemoveColumn < ActiveRecord::Migration
  def change
    remove_foreign_key :users, column: :role_id
  end
end
