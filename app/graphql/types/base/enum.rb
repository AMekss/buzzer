module Types
  class Base::Enum < GraphQL::Schema::Enum
    include GraphqlNamespacedNameResolver
  end
end
