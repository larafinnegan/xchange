class CreateJoinTableIndividualSkill < ActiveRecord::Migration
  def change
    create_table :individuals_skills, id: false do |t|
      t.integer :individual_id
      t.integer :skill_id
    end
  end
end
