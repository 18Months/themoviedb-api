module Tmdb
  class Movie < Struct

    def self.detail(id, filters={})
      result = Resource.new("/movie/#{id}", filters).run
      self.new(result)
    end

    def self.alternative_titles(id, filters={})
      result = Resource.new("/movie/#{id}/alternative_titles", filters).run

      result['titles'].map do |entry|
        self.new(entry)
      end
    end

    def self.cast(id, filters={})
      result = Resource.new("/movie/#{id}/credits", filters).run

      result['cast'].map do |entry|
        self.new(entry)
      end
    end

    def self.crew(id, filters={})
      result = Resource.new("/movie/#{id}/credits", filters).run

      result['crew'].map do |entry|
        self.new(entry)
      end
    end

    def self.director(id, filters={})
      result = Resource.new("/movie/#{id}/credits", filters).run

      result['crew'].select{ |x| x['job'] == 'Director' }.map do |entry|
        self.new(entry)
      end
    end

    def self.backdrops(id, filters={})
      result = Resource.new("/movie/#{id}/images", filters).run

      result['backdrops'].map do |entry|
        self.new(entry)
      end
    end

    def self.posters(id, filters={})
      result = Resource.new("/movie/#{id}/images", filters).run

      result['posters'].map do |entry|
        self.new(entry)
      end
    end

    def self.videos(id, filters={})
      result = Resource.new("/movie/#{id}/videos", filters).run

      result['results'].map do |entry|
        self.new(entry)
      end
    end

    def self.keywords(id, filters={})
      result = Resource.new("/movie/#{id}/keywords", filters).run

      result['keywords'].map do |entry|
        self.new(entry)
      end
    end

    def self.releases(id, filters={})
      result = Resource.new("/movie/#{id}/releases", filters).run

      result['countries'].map do |entry|
        self.new(entry)
      end
    end

    def self.translations(id, filters={})
      result = Resource.new("/movie/#{id}/translations", filters).run

      result['translations'].map do |entry|
        self.new(entry)
      end
    end

    def self.similar(id, filters={})
      result = Resource.new("/movie/#{id}/similar", filters).run
      self.new(result)
    end

    def self.reviews(id, filters={})
      result = Resource.new("/movie/#{id}/reviews", filters).run
      self.new(result)
    end

    def self.lists(id, filters={})
      result = Resource.new("/movie/#{id}/lists", filters).run
      self.new(result)
    end

    def self.changes(id, filters={})
      result = Resource.new("/movie/#{id}/changes", filters).run

      result['changes'].map do |entry|
        self.new(entry)
      end
    end

    def self.latest(filters={})
      result = Resource.new('/movie/latest', filters).run
      self.new(result)
    end

    def self.upcoming(filters={})
      result = Resource.new('/movie/upcoming', filters).run
      self.new(result)
    end

    def self.now_playing(filters={})
      result = Resource.new('/movie/now_playing', filters).run
      self.new(result)
    end

    def self.popular(filters={})
      result = Resource.new('/movie/popular', filters).run
      self.new(result)
    end

    def self.top_rated(filters={})
      result = Resource.new('/movie/top_rated', filters).run
      self.new(result)
    end

  end
end
