class Organisation < ActiveRecord::Base
  has_one :user
  has_one :classifcation
  has_many :opportunities, dependent: :destroy
  has_and_belongs_to_many :districts
  has_and_belongs_to_many :interests
end
