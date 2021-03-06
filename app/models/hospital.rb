# frozen_string_literal: true
class Hospital < ApplicationRecord
  has_many :hospital_beds, dependent: :nullify
  has_many :patients
  has_many :reports
  has_many :users

  accepts_nested_attributes_for :hospital_beds, allow_destroy: true

  validates :acronym, presence: true, length: { maximum: 8 }
  validates :city, presence: true
  validates :email, presence: true, email_format: true
  validates :name, presence: true, length: { maximum: 256 }
  validates :phone_number, phone: { allow_blank: true }

  after_commit -> { create_hospital_beds }, on: :create

  private

  def create_hospital_beds
    HospitalBedService.new(hospital_id: id).create_beds!
  end
end
