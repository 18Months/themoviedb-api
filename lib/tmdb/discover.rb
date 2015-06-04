module Tmdb
  class Discover < Struct

    def self.movie(filters={})
      result = Resource.new('/discover/movie', filters).get

      discover = self.new(result.except('results'))
      discover.results = result['results'].map do |result|
        Movie.new(result)
      end

      discover
    end

    def self.tv(filters={})
      result = Resource.new('/discover/tv', filters).get

      discover = self.new(result.except('results'))
      discover.results = result['results'].map do |result|
        TV.new(result)
      end

      discover
    end

  end
end
