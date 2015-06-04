module Tmdb
  class Genre < Struct

    def self.movie_list(filters={})
      result = Resource.new('/genre/movie/list', filters).get

      result['genres'].map do |genre|
        self.new(genre)
      end
    end

    def self.tv_list(filters={})
      result = Resource.new('/genre/tv/list', filters).get

      result['genres'].map do |genre|
        self.new(genre)
      end
    end

    def self.movies(genre_id, filters={})
      result = Resource.new("/genre/#{genre_id}/movies", filters).get

      genre = self.new(result.except('results'))
      genre.results = result['results'].map do |movie|
        Movie.new(movie)
      end

      genre
    end

  end
end
