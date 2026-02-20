module Resolvers
  module Messaging
    class Conversation < BaseResolver
      type Types::Messaging::ConversationType, null: true

      argument :title, String, required: true

      extras [:lookahead]

      def resolve(title:, lookahead:)
        rel = ::Conversation.all
        if Lookahead.new(lookahead.selection(:messages_connection)).selects?(:from)
          rel = rel.includes(messages: :participant)
        end

        rel.find_by(title: title)
      end
    end
  end
end
