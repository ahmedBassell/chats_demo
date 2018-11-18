FactoryBot.define do
  factory :app do
    name { Faker::Lorem.word }
    token { Faker::Lorem.word }
  end
end
