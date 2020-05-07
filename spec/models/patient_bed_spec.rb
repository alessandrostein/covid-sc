require 'rails_helper'

RSpec.describe PatientBed, type: :model do
  context('when valid') do
    subject { build(:patient_bed) }

    it { is_expected.to be_valid }
  end

  describe('bed_type') do
    subject { PatientBed.new }

    it { is_expected.to allow_value(:uti_adulto).for(:bed_type) }
  end

  describe('waiting_uti') do
    subject { PatientBed.new }

    it { is_expected.to allow_value(true).for(:waiting_uti) }
    it { is_expected.to allow_value(false).for(:waiting_uti) }
    it { is_expected.to_not allow_value(nil).for(:waiting_uti) }
  end

  describe('admission_date') do
    subject { PatientBed.new }

    it { is_expected.to validate_presence_of(:admission_date) }
  end
end