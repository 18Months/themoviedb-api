module Tmdb
  class Configuration < Struct

    def self.get(filters={})
      result = Resource.new('/configuration', filters).get
      self.new(result)
    end

  end
end
