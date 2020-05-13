# frozen_string_literal: true
class Occupation < ApplicationRecord
  belongs_to :report

  enum bed_type: HospitalBed.bed_types

  validates :total, presence: true
  validates :total_covid, presence: true
  validates :occupation, presence: true
  validates :occupation_covid, presence: true
  validates :total_waiting_uti, presence: true
end
