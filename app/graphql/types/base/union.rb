module Types
  class Base::Union < GraphQL::Schema::Union
    include GraphqlNamespacedNameResolver
    edge_type_class(Types::Base::Edge)
    connection_type_class(Types::Base::Connection)
  end
end
