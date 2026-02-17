module Resolvers
  class MessagesConnection < BaseResolver
    type Types::MessageType.connection_type, null: false

    def resolve
      object.messages
    end
  end
end
