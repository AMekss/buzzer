class BuzzerSchema < GraphQL::Schema
  # mutation(Types::MutationType)
  query(Types::QueryType)

  connections.add(ActiveRecord::Relation, GraphQL::Pagination::ActiveRecordRelationConnection)
end
