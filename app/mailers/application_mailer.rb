class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@#{::APP_DOMAIN}"
  layout "mailer"
end
