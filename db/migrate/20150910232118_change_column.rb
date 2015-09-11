class ChangeColumn < ActiveRecord::Migration
  def up
    remove_column :searches, :under_18, :string
    remove_column :searches, :group, :string
    add_column :searches, :under_18, :boolean
    add_column :searches, :group, :boolean
  end
end
