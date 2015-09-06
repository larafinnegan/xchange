class RemoveFirstNameFromIndividual < ActiveRecord::Migration
  def change
    remove_column :individuals, :first_name, :string
    remove_column :individuals, :last_name, :string
    remove_column :individuals, :title, :string
    remove_column :individuals, :mobile, :string
    add_column :posters, :title, :string
  end
end
