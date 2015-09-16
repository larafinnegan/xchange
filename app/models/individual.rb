class Individual < ActiveRecord::Base

  before_save :upcase_fields

  belongs_to :user
  has_and_belongs_to_many :skills
  has_many :alerts, dependent: :destroy

  has_many :applications, dependent: :destroy
  has_many :opportunities, -> { uniq }, through: :applications
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
  
  def upcase_fields
    self.town = town.split.map! {|w| w.downcase.capitalize}.join(" ")
  end
end
