class AddColumnToIndividual < ActiveRecord::Migration
  def change
    add_column :individuals, :lat, :decimal, { precision: 10, scale: 6}
    add_column :individuals, :lng, :decimal, { precision: 10, scale: 6}
  end
end
