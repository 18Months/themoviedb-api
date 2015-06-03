module Tmdb
  class Configuration < Struct

    def self.get
      result = Resource.new('/configuration').run
      self.new(result)
    end

  end
end
