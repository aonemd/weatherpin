require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'factory_bot'
FactoryBot.find_definitions

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include FactoryBot::Syntax::Methods

  driven_by :selenium_chrome_headless, options: { js_errors: false }
end
