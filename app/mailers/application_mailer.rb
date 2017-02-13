class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@#{::EMAIL_DOMAIN}"
  layout "mailer"
end
