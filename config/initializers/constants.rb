PAPERCLIP_PATH = Rails.env.development? ? ":rails_root/public" : nil
APP_DOMAIN = ENV["APP_DOMAIN"]
EMAIL_DOMAIN = ENV["EMAIL_DOMAIN"] || APP_DOMAIN
