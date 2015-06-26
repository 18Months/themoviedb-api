module Tmdb
  class TV < Struct

    def self.detail(id, filters={})
      result = Resource.new("/tv/#{id}", filters).get

      create_new_instance_with_normalized_data(result)
    end

    def self.alternative_titles(id, filters={})
      result = Resource.new("/tv/#{id}/alternative_titles", filters).get

      result['results'].map do |entry|
        self.new(entry)
      end
    end

    def self.changes(id, filters={})
      result = Resource.new("/tv/#{id}/changes", filters).get

      result['changes'].map do |entry|
        change = Change.new(entry)
        change.convert_items!
        change
      end
    end

    def self.content_ratings(id, filters={})
      result = Resource.new("/tv/#{id}/content_ratings", filters).get

      result['results'].map do |entry|
        Rating.new(entry)
      end
    end

    def self.cast(id, filters={})
      result = Resource.new("/tv/#{id}/credits", filters).get

      result['cast'].map do |entry|
        Person.new(entry)
      end
    end

    def self.crew(id, filters={})
      result = Resource.new("/tv/#{id}/credits", filters).get

      result['crew'].map do |entry|
        Person.new(entry)
      end
    end

    def self.external_ids(id, filters={})
      result = Resource.new("/tv/#{id}/external_ids", filters).get
      self.new(result)
    end

    def self.backdrops(id, filters={})
      result = Resource.new("/tv/#{id}/images", filters).get

      result['backdrops'].map do |entry|
        Backdrop.new(entry)
      end
    end

    def self.posters(id, filters={})
      result = Resource.new("/tv/#{id}/images", filters).get

      result['posters'].map do |entry|
        Poster.new(entry)
      end
    end

    def self.keywords(id, filters={})
      result = Resource.new("/tv/#{id}/keywords", filters).get

      result['results'].map do |entry|
        Keyword.new(entry)
      end
    end

    def self.similar(id, filters={})
      result = Resource.new("/tv/#{id}/similar", filters).get
      self.new(result)
    end

    def self.translations(id, filters={})
      result = Resource.new("/tv/#{id}/translations", filters).get

      result['translations'].map do |entry|
        Translation.new(entry)
      end
    end

    def self.videos(id, filters={})
      result = Resource.new("/tv/#{id}/videos", filters).get

      result['results'].map do |entry|
        Video.new(entry)
      end
    end

    def self.latest(filters={})
      result = Resource.new('/tv/latest', filters).get

      create_new_instance_with_normalized_data(result)
    end

    def self.on_the_air(filters={})
      result = Resource.new('/tv/on_the_air', filters).get
      self.new(result)
    end

    def self.airing_today(filters={})
      result = Resource.new('/tv/airing_today', filters).get
      self.new(result)
    end

    def self.top_rated(filters={})
      result = Resource.new('/tv/top_rated', filters).get
      self.new(result)
    end

    def self.popular(filters={})
      result = Resource.new('/tv/popular', filters).get
      self.new(result)
    end

    def self.create_new_instance_with_normalized_data(result)
      tv = self.new(
          result.except(
              'created_by',
              'networks',
              'seasons',
              'genres',
              'production_companies'
          )
      )

      tv.created_by = result['created_by'].map do |person|
        Person.new(person)
      end

      tv.networks = result['networks'].map do |network|
        Network.new(network)
      end

      tv.seasons = result['seasons'].map do |season|
        Tv::Season.new(season)
      end

      tv.genres = result['genres'].map do |genre|
        Genre.new(genre)
      end

      tv.production_companies = result['production_companies'].map do |company|
        Company.new(company)
      end

      tv
    end

    private_class_method :create_new_instance_with_normalized_data

  end
end
