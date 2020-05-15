# frozen_string_literal: true
class Patient < ApplicationRecord
  belongs_to :hospital
  has_one :patient_bed

  enum airways: {
    ventilacao_mecanica: 0,
    ar_ambiente: 1,
    ventilacao_nao_invasiva: 2,
  }

  enum departure_reason: {
    alta: 0,
    obito: 1,
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
end
