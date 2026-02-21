module Types
  module Messaging
    class MessageType < Types::Base::Object
      field :text, String, null: false
      field :is_urgent, Boolean, null: false, method: :urgent?
      field :from, ParticipantType, null: false

      def from
        dataloader
          .with(::Sources::ActiveRecord::BelongsTo, ::Participant.all)
          .load(object.participant_id)
      end
    end
  end
end
