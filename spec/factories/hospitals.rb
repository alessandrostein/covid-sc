FactoryBot.define do
  factory :hospital do
    acronym { Faker::Alphanumeric.alpha(number: 2) }
    name { Faker::Company.name }
    city { Faker::Address.city }
    phone_number { "(047) 3032-1253" }
    email { Faker::Internet.email }
  end
end
