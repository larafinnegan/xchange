class Opportunity < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :user
  has_and_belongs_to_many :skills
end
