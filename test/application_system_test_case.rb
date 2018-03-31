require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/poltergeist"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :poltergeist
end
