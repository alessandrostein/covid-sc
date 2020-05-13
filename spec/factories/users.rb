# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    hospital

    email { Faker::Internet.unique.safe_email }
    password { 'password' }
    password_confirmation { 'password' }

    trait :admin_user do
      role { :admin }
    end

    factory :admin, traits: [:admin_user]
  end
end
