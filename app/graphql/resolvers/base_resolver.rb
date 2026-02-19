module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    include GraphqlNamespacedNameResolver
  end
end
