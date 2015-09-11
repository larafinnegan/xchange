class Skill < ActiveRecord::Base

  has_and_belongs_to_many :individuals
  has_and_belongs_to_many :opportunities
  has_and_belongs_to_many :searches

  validates :name, presence: true
end
