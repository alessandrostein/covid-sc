FactoryBot.define do
  factory :user do
    hospital

    email { Faker::Internet.unique.safe_email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
