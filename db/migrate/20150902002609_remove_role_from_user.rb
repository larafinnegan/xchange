class RemoveRoleFromUser < ActiveRecord::Migration
  def change
    remove_column :organisations, :first_name, :string
    remove_column :organisations, :last_name, :string
    remove_column :organisations, :user_id, :integer
    remove_column :organisations, :title, :string
    remove_column :organisations, :phone, :string
    remove_column :organisations, :mobile, :string
    add_column :individuals, :title, :string
    add_column :individuals, :mobile, :string
  end
end
