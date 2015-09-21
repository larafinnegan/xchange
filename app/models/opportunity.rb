class Opportunity < ActiveRecord::Base

  before_save :capitalize_fields

  belongs_to :organisation
  belongs_to :user
  has_and_belongs_to_many :skills
  has_many :applications
  has_many :individuals, -> { uniq }, through: :applications 

  validates_presence_of :name

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
      self.name = name.downcase.capitalize
      self.town = town.downcase.capitalize if self.town
      self.postcode = postcode.upcase
    end
end
