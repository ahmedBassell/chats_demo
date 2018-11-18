FactoryBot.define do
  factory :chat do
    number { Faker::Number.number(2) }
    app_token { Faker::Lorem.word }
  end
end
