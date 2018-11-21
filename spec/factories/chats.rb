FactoryBot.define do
  factory :chat do
    number { Faker::Number.number(5) }
    app_token { Faker::IDNumber.valid }
  end
end
