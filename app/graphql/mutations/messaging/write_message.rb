module Mutations
  module Messaging
    class WriteMessage < Mutations::BaseMutation
      type ::Types::Messaging::MessageType

      argument :conversation_title, String, required: false
      argument :text, String, required: true

      def resolve(conversation_title:, text:)
        conversation = ::Conversation.find_by!(title: conversation_title)
        conversation.messages.create!(text: text, participant: context[:current_user])
      end
    end
  end
end
