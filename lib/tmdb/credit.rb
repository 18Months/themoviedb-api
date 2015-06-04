module Tmdb
  class Credit < Struct

    def self.detail(id, filters={})
      result = Resource.new("/credit/#{id}", filters).run

      credit = self.new(result.except('media'))
      media = result['media']

      credit.media = self.new(media.except('episodes', 'seasons'))

      credit.media.episodes = media['episodes'].map do |episode|
        self.new(episode)
      end

      credit.media.seasons = media['seasons'].map do |season|
        self.new(season)
      end

      credit
    end

  end
end
