# frozen_string_literal: true
FactoryBot.define do
  factory :report do
    hospital
    user

    informant_name { Faker::Name.name }
    informant_function { 'função' }
  end
end
