# frozen_string_literal: true
FactoryBot.define do
  factory :hospital_bed do
    hospital
    bed_type { HospitalBed.bed_types.keys.sample }
    sequence(:total)
    sequence(:total_covid)
  end
end
