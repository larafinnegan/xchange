class AddFirstNameToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :first_name, :string
    add_column :opportunities, :last_name, :string
    add_column :opportunities, :phone, :string
    add_column :opportunities, :title, :string
    add_column :opportunities, :email, :string
  end
end
