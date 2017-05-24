require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Listadetarefas
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :local
    Date::DATE_FORMATS[:default] = '%d/%m/%Y'
	Time::DATE_FORMATS[:default]= '%d/%m/%Y %H:%M'

	#Rspec Configuration
	config.generators do |g|
    g.assets            false
    g.helper            false
    g.test_framework :rspec,
      fixtures: true,
      view_specs: false,
      helper_specs: false,
      routing_specs: false,
      controller_specs: true,
      request_specs: false
    g.fixture_replacement :factory_girl, dir: "spec/factories"
    g.jbuilder          false
  end
	
  end
end
