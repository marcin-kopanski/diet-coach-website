require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DietCoach
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.middleware.use Rack::Deflater
    
    config.secret_key_base = ENV["SECRET_KEY_BASE"]
    
    config.assets.serve_static_files = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Strong Params
    # conflig.action_controller.permit_all_parameters = true
    config.force_ssl = true
    # mk custom
    config.eager_load_paths << "#{Rails.root}/lib"
  end
end
