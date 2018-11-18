class Chat < ApplicationRecord
  belongs_to :app
  validates_presence_of :number
end
