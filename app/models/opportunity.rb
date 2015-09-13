class Opportunity < ActiveRecord::Base

  before_save :capitalize_fields

  belongs_to :organisation
  belongs_to :user
  has_and_belongs_to_many :skills
  has_many :applications
  has_many :individuals, -> { uniq }, through: :applications 

  validates_presence_of :name, :postcode

  private

    def capitalize_fields
      self.name = name.downcase.capitalize
      self.town = town.downcase.capitalize if self.town
      self.postcode = postcode.upcase
    end
end
