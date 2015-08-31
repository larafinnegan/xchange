class CreateJoinTableDistrictOrganisation < ActiveRecord::Migration
  def change
    create_table :districts_organisations, id: false do |t|
      t.integer :district_id
      t.integer :organisation_id
    end
  end
end
