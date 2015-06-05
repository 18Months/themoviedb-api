module Tmdb
  class Keyword < Struct

    def self.detail(keyword_id, filters={})
      result = Resource.new("/keyword/#{keyword_id}", filters).get
      self.new(result)
    end

    def self.movies(keyword_id, filters={})
      result = Resource.new("/keyword/#{keyword_id}/movies", filters).get

      keyword = self.new(result.except('results'))
      keyword.results = result['results'].map do |movie|
        Movie.new(movie)
      end

      keyword
    end

  end
end
