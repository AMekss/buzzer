module Resolvers
  module Messaging
    class Conversation < BaseResolver
      type Types::Messaging::ConversationType, null: true

      argument :title, String, required: true

      def resolve(title:)
        ::Conversation.find_by(title: title)
      end
    end
  end
end
