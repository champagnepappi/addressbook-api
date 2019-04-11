FactoryBot.define do
  factory :contact do
    sequence :name do |n|
      Faker::Name.name                                                                 0
    end
    phone { rand(10**9...10**10) }

    sequence :email do |n|
      Faker::Internet.email
    end

    sequence :address do |n|
      Faker.Address.city
    end
  end
end
