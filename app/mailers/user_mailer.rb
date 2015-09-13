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
    attachments[filename] = file
    @application = application
    mail to: application.opportunity.email, subject: "New Application for #{application.opportunity.name}"
  end
end
