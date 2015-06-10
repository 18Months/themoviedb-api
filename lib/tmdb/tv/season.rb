module Tmdb
  module Tv
    class Season < Struct

      def self.detail(id, season_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}", filters).get
        season = self.new(result)
        
        season.convert_episodes_references!

        season
      end

      def self.changes(id, filters={})
        result = Resource.new("/tv/season/#{id}/changes", filters).get

        result['items'].map do |entry|
          Changes.new(entry)
        end
      end

      def self.cast(id, season_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/credits", filters).get

        result['cast'].map do |entry|
          Person.new(entry)
        end
      end

      def self.crew(id, season_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/credits", filters).get

        result['crew'].map do |entry|
          Person.new(entry)
        end
      end

      def self.director(id, season_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/credits", filters).get

        result['crew'].select{ |x| x['job'] == 'Director' }.map do |entry|
          Person.new(entry)
        end
      end

      def self.external_ids(id, season_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}", filters).get
        self.new(result)
      end

      def self.backdrops(id, season_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/images", filters).get

        result['backdrops'].map do |entry|
          Backdrop.new(entry)
        end
      end

      def self.posters(id, season_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/images", filters).get

        result['posters'].map do |entry|
          Poster.new(entry)
        end
      end

      def self.videos(id, season_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/videos", filters).get

        result['results'].map do |entry|
          Video.new(entry)
        end
      end

      private

      def convert_episodes_references!
        episodes.each do |episode|
          episode.crew.map! do |person|
            Person.new(person.to_h)
          end
        end
      end
    end
  end
end
