class Chat < ApplicationRecord
  belongs_to :app
  has_many :messages, dependent: :destroy
  attribute   :messages_count, :integer, default: 1
  validates_presence_of :number
end
