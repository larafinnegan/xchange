class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :individual, index: true, foreign_key: true
      t.references :opportunity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
