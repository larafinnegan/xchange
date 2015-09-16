class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :name
      t.string :postcode
      t.boolean :expert
      t.references :individual, index: true, foreign_key: true
      t.boolean :under_18
      t.boolean :group
      t.integer :distance
      t.integer :search_id

      t.timestamps null: false
    end
  end
end
