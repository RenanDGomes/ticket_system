class Message < ApplicationRecord
  belongs_to :ticket
  validates :sender, presence: true
  validates :content, presence: true
end
