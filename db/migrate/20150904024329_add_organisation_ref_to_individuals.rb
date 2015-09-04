class AddOrganisationRefToIndividuals < ActiveRecord::Migration
  def change
    add_reference :individuals, :organisation, index: true, foreign_key: true
  end
end
