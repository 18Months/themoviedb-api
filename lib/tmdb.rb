require 'ostruct'
require 'httparty'
require 'active_support/all'

require 'tmdb/api'
require 'tmdb/error'
require 'tmdb/struct'
require 'tmdb/utils'

require 'tmdb/resource'

require 'tmdb/account'
require 'tmdb/authentication'
require 'tmdb/backdrop'
require 'tmdb/certification'
require 'tmdb/changes'
require 'tmdb/collection'
require 'tmdb/company'
require 'tmdb/configuration'
require 'tmdb/country'
require 'tmdb/credit'
require 'tmdb/discover'
require 'tmdb/find'
require 'tmdb/genre'
require 'tmdb/image'
require 'tmdb/job'
require 'tmdb/keyword'
require 'tmdb/language'
require 'tmdb/list'
require 'tmdb/media'
require 'tmdb/movie'
require 'tmdb/network'
require 'tmdb/person'
require 'tmdb/poster'
require 'tmdb/release'
require 'tmdb/review'
require 'tmdb/search'
require 'tmdb/translation'
require 'tmdb/tv'
require 'tmdb/tv/season'
require 'tmdb/tv/episode'
require 'tmdb/video'

require 'tmdb/version'

class Hash
  def to_tmdb_struct(klass=Tmdb::Struct)
    if descendent_of_tmdb_struct?(klass)
      klass.new(self)
    else
      raise Tmdb::Error, 'Tried to convert to a non Tmdb::Struct object'
    end
  end

  private
  def descendent_of_tmdb_struct?(klass)
    klass.ancestors.include?(Tmdb::Struct)
  end
end
