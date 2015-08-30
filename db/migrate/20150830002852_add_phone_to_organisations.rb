class AddPhoneToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :website, :string
    add_column :organisations, :address_1, :string
    add_column :organisations, :address_2, :string
    add_column :organisations, :town, :string
    add_column :organisations, :county, :string
    add_column :organisations, :postcode, :string
    add_column :organisations, :description, :text
    add_column :organisations, :first_name, :string
    add_column :organisations, :last_name, :string
    add_column :organisations, :title, :string
    add_column :organisations, :phone, :string
    add_column :organisations, :mobile, :string
  end
end
