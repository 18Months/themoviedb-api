module Tmdb
  class Movie < Struct

    def self.detail(id, filters={})
      result = Resource.new("/movie/#{id}", filters).get

      create_new_instance_with_normalized_data(result)
    end

    def self.alternative_titles(id, filters={})
      result = Resource.new("/movie/#{id}/alternative_titles", filters).get

      result['titles'].map do |entry|
        self.new(entry)
      end
    end

    def self.cast(id, filters={})
      result = Resource.new("/movie/#{id}/credits", filters).get

      result['cast'].map do |entry|
        Person.new(entry)
      end
    end

    def self.crew(id, filters={})
      result = Resource.new("/movie/#{id}/credits", filters).get

      result['crew'].map do |entry|
        Person.new(entry)
      end
    end

    def self.director(id, filters={})
      result = Resource.new("/movie/#{id}/credits", filters).get

      result['crew'].select{ |x| x['job'] == 'Director' }.map do |entry|
        Person.new(entry)
      end
    end

    def self.backdrops(id, filters={})
      result = Resource.new("/movie/#{id}/images", filters).get

      result['backdrops'].map do |entry|
        Backdrop.new(entry)
      end
    end

    def self.posters(id, filters={})
      result = Resource.new("/movie/#{id}/images", filters).get

      result['posters'].map do |entry|
        Poster.new(entry)
      end
    end

    def self.videos(id, filters={})
      result = Resource.new("/movie/#{id}/videos", filters).get

      result['results'].map do |entry|
        Video.new(entry)
      end
    end

    def self.keywords(id, filters={})
      result = Resource.new("/movie/#{id}/keywords", filters).get

      result['keywords'].map do |entry|
        Keyword.new(entry)
      end
    end

    def self.releases(id, filters={})
      result = Resource.new("/movie/#{id}/releases", filters).get

      result['countries'].map do |entry|
        Release.new(entry)
      end
    end

    def self.translations(id, filters={})
      result = Resource.new("/movie/#{id}/translations", filters).get

      result['translations'].map do |entry|
        Translation.new(entry)
      end
    end

    def self.similar(id, filters={})
      result = Resource.new("/movie/#{id}/similar", filters).get
      self.new(result)
    end

    def self.recommendations(id, filters={})
      result = Resource.new("/movie/#{id}/recommendations", filters).get
      Recommendation.new(result)
    end

    def self.reviews(id, filters={})
      result = Resource.new("/movie/#{id}/reviews", filters).get
      Review.new(result)
    end

    def self.lists(id, filters={})
      result = Resource.new("/movie/#{id}/lists", filters).get
      Tmdb::List.new(result)
    end

    def self.changes(id, filters={})
      result = Resource.new("/movie/#{id}/changes", filters).get

      result['changes'].map do |entry|
        change = Change.new(entry)
        change.convert_items!
        change
      end
    end

    def self.latest(filters={})
      result = Resource.new('/movie/latest', filters).get

      create_new_instance_with_normalized_data(result)
    end

    def self.upcoming(filters={})
      result = Resource.new('/movie/upcoming', filters).get
      self.new(result)
    end

    def self.now_playing(filters={})
      result = Resource.new('/movie/now_playing', filters).get
      self.new(result)
    end

    def self.popular(filters={})
      result = Resource.new('/movie/popular', filters).get
      self.new(result)
    end

    def self.top_rated(filters={})
      result = Resource.new('/movie/top_rated', filters).get
      self.new(result)
    end

    def self.create_new_instance_with_normalized_data(result)
      movie = self.new(
          result.except(
              'genres',
              'production_companies',
              'production_countries',
              'spoken_languages'
          )
      )

      movie.genres = result['genres'].map do |genre|
        Genre.new(genre)
      end

      movie.production_companies = result['production_companies'].map do |company|
        Company.new(company)
      end

      movie.production_countries = result['production_countries'].map do |country|
        Country.new(country)
      end

      movie.spoken_languages = result['spoken_languages'].map do |language|
        Language.new(language)
      end

      movie
    end

    private_class_method :create_new_instance_with_normalized_data

  end
end
