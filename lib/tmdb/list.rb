# frozen_string_literal: true
module Tmdb
    class List < Struct
        def self.details(list_id, filters = {})
            Resource.new("/list/#{list_id}", filters).get
        end

        def self.item_status(list_id, movie_id, filters = {})
            filters[:list_id] = list_id
            filters[:movie_id] = movie_id
            Resource.new("/list/#{list_id}/item_status", filters).get
        end

        def self.create(name, description, language, filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            filters[:name] = name
            filters[:description] = description
            filters[:language] = language
            Resource.new('/list', filters).post
        end

        def self.add_item(list_id, media_id, filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            filters[:list_id] = list_id
            filters[:media_id] = media_id
            Resource.new("/list/#{list_id}/add_item", filters).post
        end

        def self.remove_item(list_id, media_id, filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            filters[:list_id] = list_id
            filters[:media_id] = media_id
            Resource.new("/list/#{list_id}/remove_item", filters).post
        end

        def self.clear(list_id, confirm, filters = {})
            @@session_id = Authentication.get_session_id
            filters[:session_id] = @@session_id
            filters[:list_id] = list_id
            filters[:confirm] = confirm
            Resource.new("/list/#{list_id}/clear", filters).post
        end
    end
end
