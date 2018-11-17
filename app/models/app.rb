class App < ApplicationRecord
  has_many :chats, dependent: :destroy

  has_secure_token :token
  validates_presence_of :name
end
