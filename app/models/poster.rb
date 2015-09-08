class Poster < ActiveRecord::Base

  belongs_to :user
  belongs_to :organisation

  validates_presence_of :title, :phone

end
