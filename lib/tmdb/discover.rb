module Tmdb
  class Discover < Struct

    def self.movie(filters={})
      result = Resource.new('/discover/movie', filters).run
      self.new(result)
    end

    def self.tv(filters={})
      result = Resource.new('/discover/tv', filters).run
      self.new(result)
    end

  end
end
