module Types
  class MutationType < Types::Base::Object
    field :write_messaging_message, mutation: ::Mutations::Messaging::WriteMessage
  end
end
