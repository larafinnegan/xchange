class AddUserRefToPosters < ActiveRecord::Migration
  def change
    add_reference :posters, :user, index: true, foreign_key: true
  end
end
