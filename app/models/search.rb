class Search < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :interests
  belongs_to :user

  def opportunities
    o = Opportunity.all
    o = o.where(group: true) if group
    o = o.where(under_18: true) if under_18
    o = o.where(expert: true) if expert
    o = o.joins(:skills).where('skill_id in (?)', skill_ids) unless skill_ids.empty?
    o = o.joins(:interests).where('interest_id in (?)', interest_ids) unless interest_ids.empty?
    o.uniq
  end

   validate :validate_postcode

  def validate_postcode
    return unless self.postcode 
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
