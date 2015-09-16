class Alert < ActiveRecord::Base
  belongs_to :individual
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :interests
end
