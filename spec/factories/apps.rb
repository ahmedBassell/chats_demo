FactoryBot.define do
  factory :app do
    name { Faker::Lorem.word }
    token { Faker::IDNumber.valid }
  end
end
