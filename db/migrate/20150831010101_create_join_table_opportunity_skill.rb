class CreateJoinTableOpportunitySkill < ActiveRecord::Migration
  def change
    create_table :opportunities_skills, id: false do |t|
      t.integer :opportunity_id
      t.integer :skill_id
    end
  end
end
