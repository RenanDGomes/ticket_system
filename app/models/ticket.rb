class Ticket < ApplicationRecord
    has_many :messages, dependent: :destroy
    validates :client_name, presence: true
  end
