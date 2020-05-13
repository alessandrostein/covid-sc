# frozen_string_literal: true
FactoryBot.define do
  factory :occupation do
    report
    bed_type { Occupation.bed_types.keys.sample }
    sequence(:total)
    sequence(:total_covid)
    sequence(:occupation)
    sequence(:occupation_covid)
    sequence(:total_waiting_uti)
  end
end
