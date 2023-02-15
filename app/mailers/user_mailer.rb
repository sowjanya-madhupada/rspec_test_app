class UserMailer < ApplicationMailer
    default from: "noreply@gmail.com"
    def user_created(user)
        @user = user
        mail to: user.email, subject: "Your account was created"
    end
end
