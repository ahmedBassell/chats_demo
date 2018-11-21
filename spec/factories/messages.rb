FactoryBot.define do
  factory :message do
    body { Faker::Lorem.word }
    number { Faker::Number.number(5) }
  end
end
