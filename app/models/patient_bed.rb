# frozen_string_literal: true
class PatientBed < ApplicationRecord
  belongs_to :patient

  enum bed_type: HospitalBed.bed_types

  validates :admission_date, presence: true
  validates :waiting_uti, inclusion: { in: [true, false] }
  validates :bed_type, presence: true

  before_validation do
    self.admission_date ||= Time.now
  end
end
