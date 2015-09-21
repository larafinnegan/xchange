class AddLatToOrganiations < ActiveRecord::Migration
  def change
    add_column :organisations, :lat, :decimal, {precision: 10, scale: 6}
    add_column :organisations, :lng, :decimal, {precision: 10, scale: 6}
    add_column :searches, :lat, :decimal, {precision: 10, scale: 6}
    add_column :searches, :lng, :decimal, {precision: 10, scale: 6}
    add_column :alerts, :lat, :decimal, {precision: 10, scale: 6}
    add_column :alerts, :lng, :decimal, {precision: 10, scale: 6}
    add_column :opportunities, :lat, :decimal, {precision: 10, scale: 6}
    add_column :opportunities, :lng, :decimal, {precision: 10, scale: 6}

  end
end
