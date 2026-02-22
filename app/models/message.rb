class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :participant

  validates :text, presence: true
end
