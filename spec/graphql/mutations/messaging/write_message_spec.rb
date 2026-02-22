RSpec.describe "mutation writeMessagingMessage" do
  subject(:data) { root_result.fetch("data").fetch("writeMessagingMessage") }
  let(:root_result) { BuzzerSchema.execute(query, context: context, variables: variables).to_h }
  let(:query) do
    <<-GRAPHQL
    mutation ($input: MutationsMessagingWriteMessageInput!){
        writeMessagingMessage(input: $input) {
            __typename
            from {
              __typename
              fullName
            }
            text
        }
    }
    GRAPHQL
  end
  let(:context) { {current_user: current_user} }
  let(:variables) do
    {
      input: {
        conversationTitle: title,
        text: "testing"
      }
    }
  end
  let(:title) { "Test-communication" }
  let!(:conversation) { ::Conversation.create(title: title) }
  let!(:current_user) { ::Participant.create(full_name: "Bob") }

  it { expect { root_result }.to change { Message.count }.by(1) }
  it { expect(root_result).to_not include("errors") }
  it { is_expected.to include("__typename" => "MessagingMessage") }
  it { is_expected.to include("text" => "testing") }
  it { is_expected.to include("from" => {"__typename" => "MessagingParticipant", "fullName" => "Bob"}) }
end
