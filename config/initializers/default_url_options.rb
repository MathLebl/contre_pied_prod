# frozen_string_literal: true
# If a default host is specifically defined then it's used otherwise the app is
# assumed to be a Heroku review app. Note that `Hash#fetch` is used defensively
# so the app will blow up at boot-time if both `DOMAIN` and
# `HEROKU_APP_NAME` aren't defined.
# in developent, if you start Rails by `NGROK_URL = http://xxxxxxxx.ngrok.io rails server`,
# you can use rails route suffix url properly, then you can communicate with an extern api.
# (We implement that for use AWS lambda in development)
config = if ENV['NGROK_URL']
           { host: ENV['NGROK_URL'] }
         elsif ENV['HEROKU_APP_NAME']
           { host: "#{ENV['HEROKU_APP_NAME']}.herokuapp.com" }
         elsif ENV['DOMAIN']
           { host: ENV['DOMAIN'] }
         else
           { host: 'localhost', port: 3000 }
         end
# Set the correct protocol as SSL isn't configured in development or test.
protocol = Rails.application.config.force_ssl ? 'https' : 'http'
Rails.application.routes.default_url_options = config.merge(protocol: protocol)
# ACTION MAILER ASSET HOST
host = if ENV['NGROK_URL']
         ENV['NGROK_URL']
       elsif ENV['HEROKU_APP_NAME']
         "https://#{ENV['HEROKU_APP_NAME']}.herokuapp.com"
       elsif ENV['DOMAIN']
         ENV['DOMAIN']
       else
         'http://localhost:3000'
       end
Rails.application.config.action_mailer.asset_host = host





