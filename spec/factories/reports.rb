FactoryBot.define do
  factory :report do
    hospital
    informant_name { Faker::Name.name }
    informant_function { "função" }
    report_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
  end
end
