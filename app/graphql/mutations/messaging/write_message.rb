module Mutations
  module Messaging
    class WriteMessage < Mutations::BaseMutation
      type ::Types::Messaging::MessageType

      argument :conversation_title, String, required: false
      argument :text, String, required: true
      argument :is_urgent, Boolean, required: false

      def resolve(conversation_title:, text:, is_urgent: false)
        raise GraphqlUserError.build(:not_authorized) if is_urgent && !context[:current_user].admin?

        conversation = ::Conversation.find_by!(title: conversation_title)
        conversation.messages.create!(text: text, participant: context[:current_user], urgent: is_urgent)

      rescue => err
        raise GraphqlUserError.maybe(err)
      end
    end
  end
end
