class Individual < ActiveRecord::Base

  before_save :upcase_fields

  belongs_to :user
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :skills

  validates :postcode, presence: true

  private
  def upcase_fields
    self.postcode = postcode.upcase
    self.town = town.downcase.capitalize  
  end
end
