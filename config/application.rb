require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ScheduleManagement
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.before_configuration do
      database_yml = File.join(Rails.root, 'config', 'database.yml')
      raw_config = File.read(database_yml)
      erb_config = ERB.new(raw_config).result
      db_config = YAML.load(erb_config, aliases: true)
      Rails.application.config.database_configuration = db_config
    end
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
