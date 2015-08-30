class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|
      t.string :first_name
      t.string :last_name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
