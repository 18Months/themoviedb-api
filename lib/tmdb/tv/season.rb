module Tmdb
  module Tv
    class Season < Struct

      def self.detail(id, season_number, filters={})
        result = Resource.new("/tv/#{id}/season/#{season_number}", filters).get
        season = self.new(result)
        
        season.convert_episodes_references!

        season
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
