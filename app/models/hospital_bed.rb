class HospitalBed < ApplicationRecord
  belongs_to :hospital

  enum bed_type: [
    :uti_adulto,
    :uti_pediatrica,
    :uti_neonatal,
    :clinico_adulto,
    :clinico_pediatrico,
    :clinico_neonatal,
    :leito_simples_com_ventilador_mecanico,
  ]

  validates :bed_type, presence: true
  validates :total, presence: true
  validates :total_covid, presence: true
end
