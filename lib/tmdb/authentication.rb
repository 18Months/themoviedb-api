# frozen_string_literal: true
module Tmdb
    class Authentication < Struct
        @@request_token = ''
        @@session_id = ''

        def self.get_session_id
            @@session_id
        end

        def self.get(filters = {})
            result = Resource.new('/authentication/token/new', filters).get
            @@request_token = result['request_token']
        end

        def self.establish_session
            result = Resource.new('/authentication/session/new', request_token: @@request_token).get
            @@session_id = result['session_id']
        end

        def self.validate(username, password)
            Authentication.get
            result = Resource.new('/authentication/token/validate_with_login', username: username, password: password, request_token: @@request_token).get
            established = result['success']
            Authentication.establish_session
        end

        def self.open_guest
            result = Resource.new('/authentication/guest_session/new').get
        end
    end
end
