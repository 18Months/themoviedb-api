module Tmdb
  class Find < Struct

    def self.movie(id, filters={})
      result = Resource.new("/find/#{id}", filters).get

      result['movie_results'].map do |entry|
        Movie.new(entry)
      end
    end

    def self.people(id, filters={})
      result = Resource.new("/find/#{id}", filters).get

      result['person_results'].map do |entry|
        person = Person.new(entry)
        person.convert_known_for!
        person
      end
    end

    def self.tv_serie(id, filters={})
      result = Resource.new("/find/#{id}", filters).get

      result['tv_results'].map do |entry|
        TV.new(entry)
      end
    end

    def self.tv_season(id, filters={})
      result = Resource.new("/find/#{id}", filters).get

      result['tv_episode_results'].map do |entry|
        TV.new(entry)
      end
    end

    def self.tv_episode(id, filters={})
      result = Resource.new("/find/#{id}", filters).get

      result['tv_season_results'].map do |entry|
        TV.new(entry)
      end
    end

  end
end
