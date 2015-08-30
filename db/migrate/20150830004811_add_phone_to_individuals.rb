class AddPhoneToIndividuals < ActiveRecord::Migration
  def change
    add_column :individuals, :phone, :string
    add_column :individuals, :additional_skills, :text
    add_column :individuals, :town, :string
    add_column :individuals, :postcode, :string
  end
end
