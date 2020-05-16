# frozen_string_literal: true
class Hospital < ApplicationRecord
  has_many :hospital_beds, dependent: :nullify
  accepts_nested_attributes_for :hospital_beds, allow_destroy: true
  has_many :users
  has_many :patients
  has_many :reports
  has_many :hospital_beds

  validates :acronym, presence: true, length: { maximum: 8 }
  validates :name, presence: true, length: { maximum: 256 }
  validates :city, presence: true
  validates :phone_number, phone: { allow_blank: true }
  validates :email, presence: true, email_format: true

  after_commit -> { create_hospital_beds }, on: :create

  def self.current_id
    Thread.current[:hospital_id]
  end

  def self.current_id=(hospital_id)
    Thread.current[:hospital_id] = hospital_id
  end

  private

  def create_hospital_beds
    HospitalBedService.new(hospital_id: id).create_beds!
  end
end
