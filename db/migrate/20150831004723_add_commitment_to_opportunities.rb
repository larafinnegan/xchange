class AddCommitmentToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :commitment, :string
    add_column :opportunities, :close, :date
    add_column :opportunities, :expire, :date
    add_column :opportunities, :benefits, :text
    add_column :opportunities, :reimburse_expenses, :boolean
    add_column :opportunities, :additional_information, :text
    add_column :opportunities, :under_18, :boolean
    add_column :opportunities, :expert, :boolean
    add_column :opportunities, :general, :boolean
    add_column :opportunities, :group, :boolean
  end
end
