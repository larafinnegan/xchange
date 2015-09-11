require 'postcodes_io'

class Individual < ActiveRecord::Base

  before_save :upcase_fields

  belongs_to :user
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :skills

  validate :validate_postcode

  def validate_postcode
    unless self.postcode 
      return errors.add(:postcode, "Postcode cannot be blank") 
    end
      a = Postcodes::IO.new
      b = a.lookup(postcode) 
      self.postcode = b.postcode
  end

  private
  


  def upcase_fields
    self.town = town.downcase.capitalize  
  end
end
