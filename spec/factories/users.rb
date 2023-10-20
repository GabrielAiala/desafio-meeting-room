FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    password { Faker::Lorem.word }
    email { Faker::Internet.email }
  end
end