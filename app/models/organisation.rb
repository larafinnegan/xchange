class Organisation < ActiveRecord::Base

  before_save :capitalize_fields

  has_one :poster
  has_one :classifcation
  has_many :opportunities, dependent: :destroy
  has_and_belongs_to_many :districts
  has_and_belongs_to_many :interests

  validates_presence_of :name, :classification_id, :postcode

  private
  def capitalize_fields
    self.postcode = self.postcode.upcase
    self.town = self.town.downcase.capitalize if self.town
    self.website = self.website.downcase if self.website
  end
end
