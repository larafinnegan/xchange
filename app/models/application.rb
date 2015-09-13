class Application < ActiveRecord::Base
  belongs_to :individual
  belongs_to :opportunity
end
