module Tmdb
  module Utils
    def has_errors?(response)
      # status_code possibilities
      # 6: Invalid id
      # 7: Invalid API key
      # 10: API key suspended, not good
      # 12: The item/record was updated successfully
      # 17: Session denied
      if response.code != 200
        case response.fetch('status_code', -1)
        when is_item_id_invalid?
          return true
        when is_api_key_invalid?
          return true
        when is_api_key_suspended?
          return true
        when is_session_denied?
          return true
        when is_update_successful?
          return false
        default
          return true
        end
      end

      return false
    end

    def is_item_id_invalid?
      ->(status_code) { status_code == 6 }
    end

    def is_api_key_invalid?
      ->(status_code) { status_code == 7 }
    end

    def is_api_key_suspended?
      ->(status_code) { status_code == 10 }
    end

    def is_update_successful?
      ->(status_code) { status_code == 12 }
    end

    def is_session_denied?
      ->(status_code) { status_code == 17 }
    end
  end
end