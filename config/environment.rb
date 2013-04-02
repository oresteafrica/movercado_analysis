# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MovercadoAnalysis::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
  :address				=> "mail.parlatano.org",
  :port					=> 587,
  :domain				=> 'parlatano.org',
  :user_name			=> "movercado+parlatano.org",
  :password				=> "smtp_movercado_#9",
  :authentication		=> 'plain',
#  :openssl_verify_mode => OpenSSL::SSL::VERIFY_NONE,
  :enable_starttls_auto => true
} 

