class Patient < ApplicationRecord
  belongs_to :hospital
  has_one :patient_bed

  enum airways: [:ventilacao_mecanica, :ar_ambiente, :ventilacao_nao_invasiva]
  enum departure_reason: [:alta, :obito]
  enum status: [:suspeito, :confirmado, :descartado]

  validates :airways, presence: true
  validates :cns, length: { maximum: 30 }
  validates :hospitalization_date, presence: true
  validates :full_name, presence: true
  validates :sisreg, length: { maximum: 30 }
end
