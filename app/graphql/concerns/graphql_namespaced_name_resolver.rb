module GraphqlNamespacedNameResolver
  extend ActiveSupport::Concern

  included do
    # in case we need the old behaviour let's alias it to `unspaced_graphql_name`
    singleton_class.send(:alias_method, :unspaced_graphql_name, :default_graphql_name)

    # override `default_graphql_name` with new namespaced behaviour, which makes it default,
    # unless subclass adds `graphql_name unspaced_graphql_name`
    singleton_class.send(:alias_method, :default_graphql_name, :namespaced_graphql_name)
  end

  class_methods do
    # Similar to what original #default_graphql_name does
    # but this one maintains namespace hierarchy, so we can organize types in modules
    def namespaced_graphql_name
      @structural_graphql_name ||= begin
        raise GraphQL::RequiredImplementationMissingError, "Anonymous class should declare a `graphql_name`" if name.nil?

        name.gsub(/(\ATypes|::|Type\z)/, "")
      end
    end
  end
end
