RSpec.describe "query conversation" do
  subject(:data) { root_result.fetch("data").fetch("conversation")  }
  let(:root_result) { BuzzerSchema.execute(query).to_h }
  let(:query) do
    <<-GRAPHQL
    {
      conversation(title: "#{title}") {
        __typename
        title
      }
    }
    GRAPHQL
  end
  let(:title) { "Test-communication" }
  let!(:conversation) { ::Conversation.create(title: title) }

  it { expect(root_result).to_not include("errors") }
  it { is_expected.to include("__typename" => "MessagingConversation") }
  it { is_expected.to include("title" => title) }
end
