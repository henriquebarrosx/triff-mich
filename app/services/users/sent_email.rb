module Users
  class SentEmail
    def self.call(user_params)
      user = User.find_by(email: user_params[:email])

      mailer = UserMailer.sample_email(user).deliver if user.present?
      mailer = { validations: "Non-existent email" } if user.nil?
      mailer
    end
  end
end