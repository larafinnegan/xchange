class Interest < ActiveRecord::Base
  has_and_belongs_to_many :organisations
  has_and_belongs_to_many :individuals
end
