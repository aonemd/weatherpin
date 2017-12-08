require 'test_helper'

class GenerateRandomGeolocationTest < ActiveSupport::TestCase
  def setup
    @grg_service = GenerateRandomGeolocation.new.call
  end

  def test_latitude
    lat = @grg_service.latitude
    assert_not_nil lat
    assert_includes (-90..90), lat
  end

  def test_longitude
    lon = @grg_service.longitude
    assert_not_nil lon
    assert_includes (-180..180), lon
  end
end
