require 'rails_helper'

RSpec.describe App, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should have_many(:chats).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
