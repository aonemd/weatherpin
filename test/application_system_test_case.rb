require "capybara/poltergeist"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :poltergeist
end
