class Individual < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :skills
  belongs_to :organisation
end
