module Types
  class Base::InputObject < GraphQL::Schema::InputObject
    include GraphqlNamespacedNameResolver
    argument_class Types::Base::Argument
  end
end
