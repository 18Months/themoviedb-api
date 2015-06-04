module Tmdb
  class Configuration < Struct

    def self.get
      result = Resource.new('/configuration').get
      self.new(result)
    end

  end
end
