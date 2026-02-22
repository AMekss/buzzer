class TestSchemaBuilder
  class TestQueryType < Types::Base::Object
    graphql_name("TestQueryType")
  end

  def self.build_with_query(&block)
    Class.new(GraphQL::Schema) do
      use GraphQL::Dataloader
      query Class.new(TestQueryType, &block)
    end
  end
end
