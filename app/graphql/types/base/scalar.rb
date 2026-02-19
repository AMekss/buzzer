module Types
  class Base::Scalar < GraphQL::Schema::Scalar
    include GraphqlNamespacedNameResolver
  end
end
