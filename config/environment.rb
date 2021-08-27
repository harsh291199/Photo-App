# Load the Rails application.
require_relative "application"

app_env_vars = File.join(Rails.root, 'config', 'initializers', 'app_env_vars.rb')
load(app_env_vars) if File.exists?(app_env_vars)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: '465',
  authentication 'plain',
  user_name: ENV["MAILER_EMAIL"],
  password: ENV["MAILER_PASSWORD"],
  :ssl => true,
  :tsl => true,
  enable_starttls_auto: true
}
