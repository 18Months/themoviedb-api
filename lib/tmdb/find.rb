module Tmdb
  class Find < Struct

    def self.movie(id, filters={})
      result = Resource.new("/find/#{id}", filters).run

      result['movie_results'].map do |entry|
        Movie.new(entry)
      end
    end

    def self.people(id, filters={})
      result = Resource.new("/find/#{id}", filters).run

      result['person_results'].map do |entry|
        Person.new(entry)
      end
    end

    def self.tv_serie(id, filters={})
      result = Resource.new("/find/#{id}", filters).run

      result['tv_results'].map do |entry|
        TV.new(entry)
      end
    end

    def self.tv_season(id, filters={})
      result = Resource.new("/find/#{id}", filters).run

      result['tv_episode_results'].map do |entry|
        TV.new(entry)
      end
    end

    def self.tv_episode(id, filters={})
      result = Resource.new("/find/#{id}", filters).run

      result['tv_season_results'].map do |entry|
        TV.new(entry)
      end
    end

  end
end
