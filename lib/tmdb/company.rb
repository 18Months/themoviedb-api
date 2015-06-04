module Tmdb
  class Company < Struct

    def self.detail(id, filters={})
      result = Resource.new("/company/#{id}", filters).run
      self.new(result)
    end

    def self.movies(id, filters={})
      result = Resource.new("/company/#{id}/movies", filters).run

      company = self.new(result.except('results'))
      company.results = result['results'].map do |movie|
        Movie.new(movie)
      end

      company
    end

  end
end
