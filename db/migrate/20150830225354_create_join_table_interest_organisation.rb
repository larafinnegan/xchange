class CreateJoinTableInterestOrganisation < ActiveRecord::Migration
  def change
    create_table :interests_organisations, id: false do |t|
      t.integer :interest_id
      t.integer :organisation_id
    end
  end
end
