require "support/test_schema_builder"

RSpec.describe "type MessagingMessage" do
  subject(:result) { schema.execute(query).to_h.fetch("data").fetch("__test") }

  let(:schema) do
    TestSchemaBuilder.build_with_query do
      field :__test, ::Types::Messaging::MessageType, null: false do
        argument :id, String, required: true
      end

      def __test(id:)
        ::Message.find(id)
      end
    end
  end

  let(:query) do
    <<-GRAPHQL
    {
      __test(id: "#{message.id}") {
        __typename
        text
        isUrgent
        from {
          __typename
        }
      }
    }
    GRAPHQL
  end

  let(:message) { ::Message.create!(text: "testing", urgent: true, participant: participant, conversation: conversation) }
  let(:conversation) { ::Conversation.create!(title: "Test-comm") }
  let(:participant) { ::Participant.create!(full_name: "Bob") }

  it { is_expected.to include("__typename" => "MessagingMessage") }
  it { is_expected.to include("text" => "testing") }
  it { is_expected.to include("isUrgent" => true) }
  it { is_expected.to include("from" => {"__typename" => "MessagingParticipant"}) }
end
