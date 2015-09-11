class Search < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :interests
  belongs_to :user

  def opportunities
    p "kkkkkkkkkkkkkkkkkkkkkk"
    o = Opportunity.all
    o = o.where('under_18 = ?', true) if under_18
    p o
    o = o.where('group = ?', true) if group
    p o
    o = o.where('expert = ?', true) if expert
    p o
    o = o.joins(:skills).where('skill_id in (?)', skill_ids) unless skill_ids.empty?
    p o
    o = o.joins(:interests).where('interest_id in (?)', interest_ids) unless interest_ids.empty?
    p o
  end

private
  def under_18_conditions
    
  end


   def group_conditions
    
  end

   def expert_conditions
    
  end

  def skill_condition

  end

  def interest_condition

  end

  def conditions
  [conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
  conditions_parts.map { |condition| condition.first }
end

def conditions_options
  conditions_parts.map { |condition| condition[1..-1] }.flatten
end

    def conditions_parts
  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end
end
