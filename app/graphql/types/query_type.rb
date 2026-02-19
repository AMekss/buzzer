module Types
  class QueryType < Types::Base::Object
    field :conversation, Types::Messaging::ConversationType, null: true do
      argument :title, String, required: true
    end

    def conversation(title:)
      Conversation.find_by(title: title)
    end
  end
end
