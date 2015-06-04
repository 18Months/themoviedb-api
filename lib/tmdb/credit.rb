module Tmdb
  class Credit < Struct

    def self.detail(id, filters={})
      result = Resource.new("/credit/#{id}", filters).run

      media = result['media']

      credit = self.new(result.except('media', 'person'))
      credit.media = Media.new(media.except('episodes', 'seasons'))

      credit.media.episodes = media['episodes'].map do |episode|
        Tv::Episode.new(episode)
      end

      credit.media.seasons = media['seasons'].map do |season|
        Tv::Season.new(season)
      end

      credit.person = Person.new(result['person'])

      credit
    end

  end
end
