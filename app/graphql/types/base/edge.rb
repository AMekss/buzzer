module Types
  class Base::Edge < Types::Base::Object
    include GraphqlNamespacedNameResolver
    # add `node` and `cursor` fields, as well as `node_type(...)` override
    include GraphQL::Types::Relay::EdgeBehaviors
  end
end
