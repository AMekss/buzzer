class Participant < ApplicationRecord
  has_and_belongs_to_many :conversations
  has_many :messages
end
