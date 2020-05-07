FactoryBot.define do
  factory :patient_bed do
    patient
    bed_type { Occupation.bed_types.keys.sample }
    admission_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    waiting_uti { [true, false].sample }
  end
end
