# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(Patient, type: :model) do
  context('when valid') do
    subject { build(:patient_bed) }

    it { is_expected.to(be_valid) }
  end

  describe('airways') do
    subject { Patient.new }

    it { is_expected.to(validate_presence_of(:airways)) }
    it { is_expected.to(allow_value(:ventilacao_mecanica).for(:airways)) }
  end

  describe('departure_reason') do
    subject { Patient.new }

    it { is_expected.to(allow_value(:alta).for(:departure_reason)) }
  end

  describe('status') do
    subject { Patient.new }

    it { is_expected.to(allow_value(:suspeito).for(:status)) }
  end

  describe('cns') do
    subject { Patient.new }

    it { is_expected.to(allow_value('12345678').for(:cns)) }
    it { is_expected.to(validate_length_of(:cns).is_at_most(30)) }
  end

  describe('full_name') do
    subject { Patient.new }

    it { is_expected.to(validate_presence_of(:full_name)) }
    it { is_expected.to(allow_value('Marvin Minsky').for(:full_name)) }
  end

  describe('sisreg') do
    subject { Patient.new }

    it { is_expected.to(allow_value('12345678').for(:sisreg)) }
    it { is_expected.to(validate_length_of(:sisreg).is_at_most(30)) }
  end

  describe('hospitalization_date') do
    subject { Patient.new }

    it { is_expected.to(validate_presence_of(:hospitalization_date)) }
  end
end
