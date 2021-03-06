# frozen_string_literal: true
FactoryBot.define do
  factory :patient do
    hospital
    airways { Patient.airways.keys.sample }
    departure_reason { nil }
    status { Patient.statuses.keys.sample }
    cns { Faker::Number.number(digits: 15) }
    sisreg { Faker::Number.number(digits: 9) }
    full_name { Faker::Name.name }
    hospitalization_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
  end
end
