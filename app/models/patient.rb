# frozen_string_literal: true
class Patient < ApplicationRecord
  belongs_to :hospital
  has_one :patient_bed

  scope :active, -> { where(departure_reason: nil) }

  accepts_nested_attributes_for :patient_bed, allow_destroy: true

  enum airways: {
    ventilacao_mecanica: 0,
    ar_ambiente: 1,
    ventilacao_nao_invasiva: 2,
  }

  enum departure_reason: {
    alta: 0,
    obito: 1,
    transferencia: 2,
  }
  enum status: {
    suspeito: 0,
    confirmado: 1,
    descartado: 2,
  }

  validates :full_name, presence: true
  validates :airways, presence: true
  validates :hospitalization_date, presence: true
  validates :cns, length: { is: 15 }
  validates :sisreg, length: { is: 9 }

  def patient_bed_attributes=(attrbutes)
    if attributes['id'].present?
      self.patient_bed = PatientBed.find(attributes['id'])
    end
    super
  end
end
