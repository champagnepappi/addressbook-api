FactoryBot.define do
  factory :contact do
    phone { rand(10**9...10**10) }
    name { Faker::Name.first_name }
    email  { Faker::Internet.email }
    address { Faker::Address.city }
  end
end
