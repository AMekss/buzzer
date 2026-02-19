module Types
  module Messaging
    class MessageType < Types::Base::Object
      field :text, String, null: false
      field :is_urgent, Boolean, null: false, method: :mandatory?
      field :from, ParticipantType, null: false, method: :participant
    end
  end
end
