class Search < ActiveRecord::Base
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :interests
  belongs_to :user

  def opportunities
    p "kkkkkkkkkkkkkkkkkkkkkk"
    o = Opportunity.all
    o = o.where(group: true) if group
    o = o.where(under_18: true) if under_18
    o = o.where(expert: true) if expert
    o = o.joins(:skills).where('skill_id in (?)', skill_ids) unless skill_ids.empty?
    o = o.joins(:interests).where('interest_id in (?)', interest_ids) unless interest_ids.empty?
    o.uniq
  end

private
  def under_18_conditions
    ['under_18 = ?', true] if under_18
  end


   def group_conditions
    ['group = ?', true] if group
  end

   def expert_conditions
    ['expert = ?', true] if expert
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
