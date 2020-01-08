require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyWishList
  class Application < Rails::Application
    # Actionmailer
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.perform_deliveries = true
    config.action_mailer.delivery_method = :mailgun
    config.action_mailer.default :charset => "utf-8"
    config.action_mailer.mailgun_settings = {
        api_key: ENV['MAILGUN_KEY'],
        domain: ENV['MAILGUN_URL']
    }
    config.action_mailer.smtp_settings = {
        address: "smtp.mailgun.org",
        port: 587,
        authentication: "plain",
        enable_starttls_auto: true,
        user_name: ENV['MAILGUN_EMAIL'],
        password: ENV['MAILGUN_PASSWORD'],
        openssl_verify_mode: "none"
    }

    config.i18n.default_locale = 'en'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.assets.precompile += %w( home.js home.css wish_lists.js wish_lists.css )

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :patch, :options]
      end
    end
  end
end
