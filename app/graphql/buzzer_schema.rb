class BuzzerSchema < GraphQL::Schema
  # mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Dataloader

  connections.add(ActiveRecord::Relation, GraphQL::Pagination::ActiveRecordRelationConnection)
end
