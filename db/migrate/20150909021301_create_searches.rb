class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
      t.string :postcode
      t.boolean :expert
      t.string :under_18
      t.string :group

      t.timestamps null: false
    end
  end
end
