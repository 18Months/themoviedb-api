module Tmdb
  class Image < Struct

    def convert_media_multiple!
      results.each do |result|
        media_type = find_media_type(result)
        result.media = media_type.new(result.media.to_h)
      end
    end

    private

    def find_media_type(obj)
      case obj.media_type
        when 'movie'
          Movie
        when 'tv'
          TV
        else
          Multi
      end
    end

  end
end
