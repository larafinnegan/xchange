class Application < ActiveRecord::Base
  attr_accessor :cover_letter, :resume
  
  belongs_to :individual
  belongs_to :opportunity

  validates_presence_of :individual, :opportunity, :cover_letter, :resume



end
