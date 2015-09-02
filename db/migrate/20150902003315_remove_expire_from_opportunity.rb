class RemoveExpireFromOpportunity < ActiveRecord::Migration
  def change
    remove_column :opportunities, :expire, :date
  end
end
