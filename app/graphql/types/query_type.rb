module Types
  class QueryType < Types::Base::Object
    field :conversation, resolver: Resolvers::Messaging::Conversation
  end
end
