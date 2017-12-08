module JSONResponse
  def json_response
    result = JSON.parse(@response.body)
    result.is_a?(Hash) ? result.with_indifferent_access : result
  rescue JSON::ParserError
    raise "JSON couldn't parse response with code: (#{response.code}) and body: #{response.body}"
  end
end
