class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :mobile
      t.string :phone
      t.string :mobile

      t.timestamps null: false
    end
  end
end
