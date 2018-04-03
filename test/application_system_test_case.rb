require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/poltergeist"

require 'factory_bot'
FactoryBot.find_definitions

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include FactoryBot::Syntax::Methods
  driven_by :poltergeist, options: { js_errors: false }
end
