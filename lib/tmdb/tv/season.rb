module Tmdb
  module Tv
    class Season < Struct

      def self.detail(id, season_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}", filters).get

        create_new_instance_with_normalized_data(result)
      end

      def self.changes(id, filters={})
        result = Resource.new("/tv/season/#{id}/changes", filters).get

        result['changes'].map do |entry|
          change = Change.new(entry)
          change.convert_items!
          change
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

      def self.external_ids(id, season_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}/external_ids", filters).get
        self.new(result)
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

      def self.create_new_instance_with_normalized_data(result)
        season = self.new(
            result.except(
                'episodes'
            )
        )

        season.episodes = result['episodes'].map do |episode|
          new_episode = Tv::Episode.new(
              episode.except(
                  'crew',
                  'guest_stars'
              )
          )

          new_episode.crew = episode['crew'].map do |entry|
            Person.new(entry)
          end

          new_episode.guest_stars = episode['guest_stars'].map do |entry|
            Person.new(entry)
          end

          new_episode
        end

        season
      end

      private_class_method :create_new_instance_with_normalized_data

    end
  end
end
