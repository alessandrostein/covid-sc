class PatientBed < ApplicationRecord
  belongs_to :patient

  enum bed_type: HospitalBed.bed_types

  validates :admission_date, presence: true
  validates :waiting_uti, inclusion: { in: [true, false] }
end
