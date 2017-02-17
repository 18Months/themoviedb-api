# frozen_string_literal: true
module Tmdb
    class List < Struct
        def self.details(list_id)
            Resource.new("/list/#{list_id}").get
        end

        def self.item_status(list_id, movie_id)
            Resource.new("/list/#{list_id}/item_status", movie_id: movie_id).get
        end

        def self.create(name, description, language)
            @@session_id = Authentication.get_session_id
            Resource.new('/list', session_id: @@session_id, name: name, description: description, language: language).post
        end

        def self.add_item(list_id, media_id)
            @@session_id = Authentication.get_session_id
            Resource.new("/list/#{list_id}/add_item", session_id: @@session_id, media_id: media_id).post
        end

        def self.remove_item(list_id, media_id)
            @@session_id = Authentication.get_session_id
            Resource.new("/list/#{list_id}/remove_item", session_id: @@session_id, media_id: media_id).post
        end

        def self.clear(list_id, confirm)
            @@session_id = Authentication.get_session_id
            Resource.new("/list/#{list_id}/clear", session_id: @@session_id, confirm: confirm).post
        end
    end
end
