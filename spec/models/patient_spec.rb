# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(Patient, type: :model) do
  context('when valid') do
    subject { build(:patient_bed) }

    it { is_expected.to(be_valid) }
  end

  context('associations') do
    it { should belong_to(:hospital) }
    it { should have_one(:patient_bed) }
  end

  context 'attributes' do
    subject { Patient.new }

    describe('airways') do
      it { is_expected.to(validate_presence_of(:airways)) }
      it { is_expected.to(allow_value(:ventilacao_mecanica).for(:airways)) }
    end

    describe('departure_reason') do
      it { is_expected.to(allow_value(:alta).for(:departure_reason)) }
    end

    describe('status') do
      it { is_expected.to(allow_value(:suspeito).for(:status)) }
    end

    describe('cns') do
      it { is_expected.to(allow_value('aaaaaaaaaabbbbb').for(:cns)) }
      it { is_expected.to(validate_length_of(:cns).is_equal_to(15)) }
    end

    describe('full_name') do
      it { is_expected.to(validate_presence_of(:full_name)) }
      it { is_expected.to(allow_value('Marvin Minsky').for(:full_name)) }
    end

    describe('sisreg') do
      it { is_expected.to(allow_value('aaaaaaaaa').for(:sisreg)) }
      it { is_expected.to(validate_length_of(:sisreg).is_equal_to(9)) }
    end

    describe('hospitalization_date') do
      it { is_expected.to(validate_presence_of(:hospitalization_date)) }
    end
  end
end
