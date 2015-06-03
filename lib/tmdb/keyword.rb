module Tmdb
  class Keyword < Struct

    def self.detail(keyword_id, filters={})
      result = Resource.new("/keyword/#{keyword_id}/movies", filters).run
      self.new(result)
    end

    def self.movies(keyword_id, filters={})
      result = Resource.new("/keyword/#{keyword_id}/movies", filters).run

      keyword = self.new(result.except('results'))
      keyword.results = result['results'].map do |movie|
        Movie.new(movie)
      end

      keyword
    end

  end
end