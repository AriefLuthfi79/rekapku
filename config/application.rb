require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Rekapku
  class Application < Rails::Application
    config.load_defaults 5.2

    config.generators.system_tests = nil
    config.generators do |g|
      g.javascript_engine :js
      g.scaffold_stylesheet false
    end
  end
end
