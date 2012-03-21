# Load the rails application
require File.expand_path('../application', __FILE__)

# Load heroku vars from local file
heroku_env = File.join(Rails.root, 'config', 'heroku_env.rb')
load(heroku_env) if File.exists?(heroku_env)

# Initialize the rails application
Softball::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,  
  :address            => 'smtpout.secureserver.net',
  :port               => 3535,
  :tls                  => true,
  :domain             => 'makemeabaseballcard.com', 
  :authentication     => :plain,
  :user_name          => ENV['smtp_user_name'],
  :password           => ENV['smtp_password']
}
