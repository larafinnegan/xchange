class Opportunity < ActiveRecord::Base
  belongs_to :organisation
  has_and_belongs_to_many :skills
end
