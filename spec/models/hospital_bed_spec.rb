# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(HospitalBed, type: :model) do
  context('when valid') do
    subject { build(:hospital_bed) }

    it { is_expected.to(be_valid) }
  end

  context('associations') do
    it { should belong_to(:hospital) }
  end

  context 'attributes' do
    subject { HospitalBed.new }

    describe('bed_type') do
      it { is_expected.to(validate_presence_of(:bed_type)) }
      it { is_expected.to(allow_value(:uti_adulto).for(:bed_type)) }
    end

    describe('total') do
      it { is_expected.to(validate_presence_of(:total)) }
      it { is_expected.to(allow_value(1).for(:total)) }
    end

    describe('total_covid') do
      it { is_expected.to(validate_presence_of(:total)) }
      it { is_expected.to(allow_value(1).for(:total)) }
    end
  end
end
