class CreateJoinTableIndividualInterest < ActiveRecord::Migration
  def change
    create_table :individuals_interests, id: false do |t|
      t.integer :individual_id
      t.integer :interest_id
    end
  end
end
