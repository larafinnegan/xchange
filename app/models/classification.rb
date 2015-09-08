class Classification < ActiveRecord::Base
  before_save :upcase_name

  validates :name, presence: true

  belongs_to :organisation

  private
   def upcase_name
    self.name = name.downcase.capitalize
  end
end
