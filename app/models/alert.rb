class Alert < ActiveRecord::Base
  belongs_to :individual
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :interests

#  validate :validate_postcode

  def validate_postcode
    return unless self.postcode.nil?
    a = Postcodes::IO.new
    b = a.lookup(postcode) 
    if b.nil?
      return errors.add(:postcode, "#{postcode.upcase} is not a valid postcode.") 
    else
      self.postcode = b.postcode
      self.lat = b.latitude
      self.lng = b.longitude
    end
  end
end
