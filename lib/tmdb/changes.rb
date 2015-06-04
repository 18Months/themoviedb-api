module Tmdb
  class Changes < Struct

    def self.movie(filters={})
      result = Resource.new("/movie/changes", filters).run

      change = self.new(result.except('results'))
      change.results = result['results'].map do |result|
        self.new(result)
      end

      change
    end

    def self.person(filters={})
      result = Resource.new("/person/changes", filters).run

      change = self.new(result.except('results'))
      change.results = result['results'].map do |result|
        self.new(result)
      end

      change
    end

    def self.tv(filters={})
      result = Resource.new("/tv/changes", filters).run

      change = self.new(result.except('results'))
      change.results = result['results'].map do |result|
        self.new(result)
      end

      change
    end

  end
end
