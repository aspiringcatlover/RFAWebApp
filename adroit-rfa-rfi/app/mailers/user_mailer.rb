class UserMailer < ApplicationMailer

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to RFA Dashboard')
    end

    def rfa_open_cases_email(user)
        @user = user
        mail(to: @user.email, subject: "RFA cases report")
end
