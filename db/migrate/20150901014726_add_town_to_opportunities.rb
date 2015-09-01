class AddTownToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :town, :string
    add_column :opportunities, :postcode, :string
  end
end
