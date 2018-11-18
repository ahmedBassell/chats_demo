class App < ApplicationRecord
  has_many :chats, dependent: :destroy, primary_key: 'token', foreign_key: 'app_token'
  attribute   :chats_count, :integer, default: 1
  has_secure_token :token
  validates_presence_of :name
end
