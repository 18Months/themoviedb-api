# frozen_string_literal: true
module Tmdb
    class Account < Struct
        def self.details(filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            Resource.new('/account', filters).get
        end

        def self.lists(filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            Resource.new('/account/%7Baccount_id%7D/lists', filters).get
        end

        def self.favorite_movies(filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            Resource.new('/account/%7Baccount_id%7D/favorite/movies', filters).get
        end

        def self.favorite_tv(filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            Resource.new('/account/%7Baccount_id%7D/favorite/tv', filters).get
        end

        def self.rated_movies(filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            Resource.new('/account/%7Baccount_id%7D/rated/movies', filters).get
        end

        def self.rated_tv(filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            Resource.new('/account/%7Baccount_id%7D/rated/tv', filters).get
        end

        def self.rated_episodes(filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            Resource.new('/account/%7Baccount_id%7D/rated/tv/episodes', filters).get
        end

        def self.movies_watchlist(filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            Resource.new('/account/%7Baccount_id%7D/watchlist/movies', filters).get
        end

        def self.tv_watchlist(filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            Resource.new('/account/%7Baccount_id%7D/watchlist/tv', filters).get
        end

        def self.add_to_watchlist(media_type, media_id, watchlist = true, filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            filters[:media_type] = media_type
            filters[:media_id] = media_id
            filters[:watchlist] = watchlist
            Resource.new('/account/%7Baccount_id%7D/watchlist', filters).post
        end

        def self.mark(media_type, media_id, favorite = true, filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            filters[:media_type] = media_type
            filters[:media_id] = media_id
            filters[:favorite] = favorite
            Resource.new('/account/%7Baccount_id%7D/favorite', filters).post
        end
    end
end
