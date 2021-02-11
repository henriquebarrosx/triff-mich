class UserMailer < ApplicationMailer
  default from: "noreply@findme.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: "Redefinição de Senha")
  end
end
