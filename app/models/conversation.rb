class Conversation < ApplicationRecord
  has_and_belongs_to_many :participants
  has_many :messages
end
