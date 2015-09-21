class Organisation < ActiveRecord::Base

  before_save :capitalize_fields

  has_many :poster
  has_one :classifcation
  has_many :opportunities, dependent: :destroy
  has_and_belongs_to_many :districts
  has_and_belongs_to_many :interests

  validates_presence_of :name, :classification_id

 validate :validate_postcode

  def validate_postcode
    unless self.postcode 
      return errors.add(:postcode, "Postcode cannot be blank") 
    end
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

  private
  def capitalize_fields
    self.town = self.town.downcase.capitalize if self.town
    self.website = self.website.downcase if self.website
  end
end
