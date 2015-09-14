class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account Activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end



  def submit_app(application, file, filename)
    p application

    @application = application
    @opportunity = Opportunity.find(application.opportunity_id)
    attachments[filename] = file
    mail to: @opportunity.email, subject: "New Application"
    
  end
end
