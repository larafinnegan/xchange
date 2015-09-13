class Application < ActiveRecord::Base
  attr_accessor :cover_letter, :resume
  belongs_to :individual
  belongs_to :opportunity

  validates_presence_of :cover_letter, :resume

  def submit_application_email
    UserMailer.submit_app(self).deliver_now
  end

end
