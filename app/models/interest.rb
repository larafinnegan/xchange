class Interest < ActiveRecord::Base

  before_save :upcase_name

  has_and_belongs_to_many :organisations
  has_and_belongs_to_many :searches
  has_and_belongs_to_many :alerts

  validates :name, presence: true

  private
    def upcase_name
      self.name = name.downcase.capitalize
    end
end
