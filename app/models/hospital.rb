class Hospital < ApplicationRecord
  has_one :hospital_bed, dependent: :nullify
  has_many :patients

  validates :acronym, presence: true, length: { maximum: 8 }
  validates :name, presence: true, length: { maximum: 256 }
  validates :city, presence: true
  validates :phone_number, phone: { allow_blank: true }
  validates :email, presence: true, email_format: true
end
