module Tmdb
  module Tv
    class Episode < Struct

      def self.detail(id, season_number, episode_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/episode/#{episode_number}", filters).get

        create_new_instance_with_normalized_data(result)
      end

      def self.changes(id, filters={})
        result = Resource.new("/tv/episode/#{id}/changes", filters).get

        result['changes'].map do |entry|
          change = Change.new(entry)
          change.convert_items!
          change
        end
      end

      def self.cast(id, season_number, episode_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/episode/#{episode_number}/credits", filters).get

        result['cast'].map do |entry|
          Person.new(entry)
        end
      end

      def self.crew(id, season_number, episode_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/episode/#{episode_number}/credits", filters).get

        result['crew'].map do |entry|
          Person.new(entry)
        end
      end

      def self.guest_stars(id, season_number, episode_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/episode/#{episode_number}/credits", filters).get

        result['guest_stars'].map do |entry|
          Person.new(entry)
        end
      end

      def self.external_ids(id, season_number, episode_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/episode/#{episode_number}/external_ids", filters).get
        self.new(result)
      end

      def self.posters(id, season_number, episode_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/episode/#{episode_number}/images", filters).get

        result['stills'].map do |entry|
          Poster.new(entry)
        end
      end

      def self.videos(id, season_number, episode_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/episode/#{episode_number}/videos", filters).get

        result['results'].map do |entry|
          Video.new(entry)
        end
      end

      def self.create_new_instance_with_normalized_data(result)
        episode = self.new(
            result.except(
                'crew',
                'guest_stars'
            )
        )

        episode.crew = result['crew'].map do |person|
          Person.new(person)
        end

        episode.guest_stars = result['guest_stars'].map do |person|
          Person.new(person)
        end

        episode
      end

      private_class_method :create_new_instance_with_normalized_data

    end
  end
end
