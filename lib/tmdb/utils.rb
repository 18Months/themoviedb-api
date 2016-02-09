module Tmdb
  module Utils
    def parse_json(string)
      begin
        JSON.parse(string)
      rescue JSON::ParserError
        return {}
      end
    end
  end
end
