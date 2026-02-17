module Types
  class ConversationType < Types::Base::Object
    field :title, String, null: false
    field :description, String, null: true
    field :participants, [ParticipantType], null: false
    field :messages_connection, resolver: Resolvers::MessagesConnection
  end
end
