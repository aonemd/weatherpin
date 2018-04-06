class PostDecorator < BaseDecorator
  def decorate
    {
      temperature: to_temperature,
      location: location_name,
      username: user.username,
      created_at: created_at_formatted
    }.as_json
  end

  def to_temperature
    symbol = case unit
             when 'celsius'.freeze
               'C'.freeze
             when 'fahrenheit'.freeze
               'F'.freeze
             end
    "#{temperature}'#{symbol}".freeze
  end
end
