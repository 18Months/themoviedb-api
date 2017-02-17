# frozen_string_literal: true
module Tmdb
    class Account < Struct
        def self.details
            @@session_id = Authentication.get_session_id

            Resource.new('/account', session_id: @@session_id).get
        end

        def self.lists(account_id = '%7Baccount_id%7D')
            @@session_id = Authentication.get_session_id

            Resource.new("/account/#{account_id}/lists", session_id: @@session_id).get
        end

        def self.favorite_movies(account_id = '%7Baccount_id%7D')
            @@session_id = Authentication.get_session_id

            Resource.new("/account/#{account_id}/favorite/movies", session_id: @@session_id).get
        end

        def self.favorite_tv(account_id = '%7Baccount_id%7D')
            @@session_id = Authentication.get_session_id

            Resource.new("/account/#{account_id}/favorite/tv", session_id: @@session_id).get
        end

        def self.rated_movies(account_id = '%7Baccount_id%7D')
            @@session_id = Authentication.get_session_id

            Resource.new("/account/#{account_id}/rated/movies", session_id: @@session_id).get
        end

        def self.rated_tv(account_id = '%7Baccount_id%7D')
            @@session_id = Authentication.get_session_id

            Resource.new("/account/#{account_id}/rated/tv", session_id: @@session_id).get
        end

        def self.rated_episodes(account_id = '%7Baccount_id%7D')
            @@session_id = Authentication.get_session_id

            Resource.new("/account/#{account_id}/rated/tv/episodes", session_id: @@session_id).get
        end

        def self.movies_watchlist(account_id = '%7Baccount_id%7D')
            @@session_id = Authentication.get_session_id

            Resource.new("/account/#{account_id}/watchlist/movies", session_id: @@session_id).get
        end

        def self.tv_watchlist(account_id = '%7Baccount_id%7D')
            @@session_id = Authentication.get_session_id

            Resource.new("/account/#{account_id}/watchlist/tv", session_id: @@session_id).get
        end

        def self.add_to_watchlist(media_type, media_id, watchlist = true, account_id = '%7Baccount_id%7D')
            @@session_id = Authentication.get_session_id

            Resource.new("/account/#{account_id}/watchlist", session_id: @@session_id, media_type: media_type, media_id: media_id, watchlist: watchlist).post
        end

        def self.mark(media_type, media_id, favorite = true, account_id = '%7Baccount_id%7D')
            @@session_id = Authentication.get_session_id

            Resource.new("/account/#{account_id}/favorite", session_id: @@session_id, media_type: media_type, media_id: media_id, favorite: favorite).post
        end
    end
end
