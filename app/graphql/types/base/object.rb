module Types
  class Base::Object < GraphQL::Schema::Object
    include GraphqlNamespacedNameResolver

    edge_type_class(Types::Base::Edge)
    connection_type_class(Types::Base::Connection)
    field_class Types::Base::Field
  end
end
