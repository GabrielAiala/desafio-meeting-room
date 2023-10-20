FactoryBot.define do
  factory :reservation do
    user
    room
    start_date { Faker::Date }
    end_date { Faker::Date }
  end
end