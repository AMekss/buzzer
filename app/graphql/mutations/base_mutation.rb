module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    include GraphqlNamespacedNameResolver

    argument_class Types::Base::Argument
    field_class Types::Base::Field
    input_object_class Types::Base::InputObject
    object_class Types::Base::Object
  end
end
