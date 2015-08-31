class AddClassificationToOrganisations < ActiveRecord::Migration
  def change
    add_reference :organisations, :classification, index: true, foreign_key: true
  end
end
