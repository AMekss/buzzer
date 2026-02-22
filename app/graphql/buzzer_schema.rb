class BuzzerSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use GraphQL::Dataloader

  connections.add(ActiveRecord::Relation, GraphqlStableConnection)

  rescue_from(StandardError) do |err, obj, args, ctx, field|
    raise GraphqlError.build(Rails.env.development?, err, obj, args, ctx, field)
  end
end
