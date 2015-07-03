module Tmdb
  class Credit < Struct

    def self.detail(id, filters={})
      result = Resource.new("/credit/#{id}", filters).get

      media = result['media']

      credit = self.new(result.except('media', 'person'))
      credit.media = Media.new(media.except('episodes', 'seasons'))

      if media['episodes'].present?
        credit.media.episodes = media['episodes'].map do |episode|
          Tv::Episode.new(episode)
        end
      end

      if media['seasons'].present?
        credit.media.seasons = media['seasons'].map do |season|
          Tv::Season.new(season)
        end
      end

      credit.person = Person.new(result['person'])

      credit
    end

  end
end
