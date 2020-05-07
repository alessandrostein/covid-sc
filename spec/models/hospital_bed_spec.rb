require 'rails_helper'

RSpec.describe HospitalBed, type: :model do
  context('when valid') do
    subject { build(:hospital_bed) }

    it { is_expected.to be_valid }
  end

  describe('bed_type') do
    subject { HospitalBed.new }

    it { is_expected.to validate_presence_of(:bed_type) }
    it { is_expected.to allow_value(:uti_adulto).for(:bed_type) }
  end

  describe('total') do
    subject { HospitalBed.new }

    it { is_expected.to validate_presence_of(:total) }
    it { is_expected.to allow_value(1).for(:total) }
  end

  describe('total_covid') do
    subject { HospitalBed.new }

    it { is_expected.to validate_presence_of(:total) }
    it { is_expected.to allow_value(1).for(:total) }
  end
end
