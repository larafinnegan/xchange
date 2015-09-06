class AddOrganisationRefToPosters < ActiveRecord::Migration
  def change
    add_reference :posters, :organisation, index: true, foreign_key: true
  end
end
