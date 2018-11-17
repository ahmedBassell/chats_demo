FactoryBot.define do
  factory :chat do
    number { Faker::StarWars.character }
    app_id nil
  end
end
