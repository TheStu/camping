class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.hello.subject
  #
  def hello(time)
    @time = time
    mail to: "stuwashere@gmail.com"
  end
end
