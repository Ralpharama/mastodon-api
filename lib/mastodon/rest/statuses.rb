require 'mastodon/rest/utils'
require 'mastodon/status'

module Mastodon
  module REST
    module Statuses
      include Mastodon::REST::Utils

      # Create new status
      # @param text [String]
      # @param in_reply_to_id [Integer]
      # @param media_ids [Array<Integer>]
      # @return [Mastodon::Status]
      def create_status(text, in_reply_to_id = nil, media_ids = [])
        perform_request_with_object(:post, "/api/v1/statuses", { status: text, in_reply_to_id: in_reply_to_id, media_ids: media_ids }, Mastodon::Status)
      end

      # Retrieve status
      # @param id [Integer]
      # @return [Mastodon::Status]
      def status(id)
        perform_request_with_object(:get, "/api/v1/statuses/#{id}", {}, Mastodon::Status)
      end

      # Destroy status
      # @param id [Integer]
      # @return [Boolean]
      def destroy_status(id)
        !perform_request(:delete, "/api/v1/statuses/#{id}").nil?
      end

      # Reblog a status
      # @param id [Integer]
      # @return [Mastodon::Status]
      def reblog(id)
        perform_request_with_object(:post, "/api/v1/statuses/#{id}/reblog", {}, Mastodon::Status)
      end

      # Undo a reblog of a status
      # @param id [Integer]
      # @return [Mastodon::Status]
      def unreblog(id)
        perform_request_with_object(:post, "/api/v1/statuses/#{id}/unreblog", {}, Mastodon::Status)
      end
    end
  end
end
