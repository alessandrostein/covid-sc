# frozen_string_literal: true
class Hospital < ApplicationRecord
  has_one :hospital_bed, dependent: :nullify
  has_many :users
  has_many :patients
  has_many :reports

  validates :acronym, presence: true, length: { maximum: 8 }
  validates :name, presence: true, length: { maximum: 256 }
  validates :city, presence: true
  validates :phone_number, phone: { allow_blank: true }
  validates :email, presence: true, email_format: true
end
