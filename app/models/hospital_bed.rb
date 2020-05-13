# frozen_string_literal: true
class HospitalBed < ApplicationRecord
  belongs_to :hospital

  enum bed_type: {
    uti_adulto: 0,
    uti_pediatrica: 1,
    uti_neonatal: 2,
    clinico_adulto: 3,
    clinico_pediatrico: 4,
    clinico_neonatal: 5,
    leito_simples_com_ventilador_mecanico: 6,
  }

  validates :bed_type, presence: true
  validates :total, presence: true
  validates :total_covid, presence: true
end
