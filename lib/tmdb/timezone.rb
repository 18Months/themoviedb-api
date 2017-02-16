# frozen_string_literal: true
module Tmdb
    class Timezone < Struct
        def self.get(filters = {})
            result = Resource.new('/timezones/list', filters).get
            new(result)
        end
    end
end
