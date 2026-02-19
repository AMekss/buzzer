module Types
  class Base::Connection < Types::Base::Object
    include GraphqlNamespacedNameResolver
    # add `nodes` and `pageInfo` fields, as well as `edge_type(...)` and `node_nullable(...)` overrides
    include GraphQL::Types::Relay::ConnectionBehaviors
  end
end
