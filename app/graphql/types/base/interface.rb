module Types
  module Base::Interface
    include GraphQL::Schema::Interface
    include GraphqlNamespacedNameResolver
    edge_type_class(Types::Base::Edge)
    connection_type_class(Types::Base::Connection)

    field_class Types::Base::Field
  end
end
