module Resolvers
  module Messaging
    class MessagesConnection < BaseResolver
      type Types::Messaging::MessageType.connection_type, null: false

      def resolve
        object.messages
      end
    end
  end
end
