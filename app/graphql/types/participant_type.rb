module Types
  class ParticipantType < Types::Base::Object
    field :full_name, String, null: false
    field :message_count, Integer, null: false
    field :connections, [ConversationType], null: false

    def message_count
      object.messages.count
    end
  end
end
