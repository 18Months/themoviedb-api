module Tmdb
  class Genre < Struct

    def self.list(filters={})
      result = Resource.new('/genre/list', filters).run

      result['genres'].map do |genre|
        self.new(genre)
      end
    end

    def self.movies(genre_id, filters={})
      result = Resource.new("/genre/#{genre_id}/movies", filters).run

      genre = self.new(result.except('results'))
      genre.results = result['results'].map do |movie|
        Movie.new(movie)
      end

      genre
    end

  end
end