class Organisation < ActiveRecord::Base
  belongs_to :user
  has_one :classifcation
  has_many :opportunities, dependent: :destroy
  has_and_belongs_to_many :districts
  has_and_belongs_to_many :interests
end
