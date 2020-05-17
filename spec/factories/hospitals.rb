# frozen_string_literal: true
FactoryBot.define do
  factory :hospital do
    acronym { Faker::Alphanumeric.alpha(number: 2) }
    city { Faker::Address.city }
    email { Faker::Internet.email }

    private { false }

    name { Faker::Company.name }
    phone_number { "(047) 3032-1253" }
  end
end
