# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(PatientBed, type: :model) do
  context('when valid') do
    subject { build(:patient_bed) }

    it { is_expected.to(be_valid) }
  end

  context('associations') do
    it { should belong_to(:patient) }
  end

  context 'attributes' do
    subject { PatientBed.new }

    describe('bed_type') do
      it { is_expected.to(allow_value(:uti_adulto).for(:bed_type)) }
      it { is_expected.to(validate_presence_of(:bed_type)) }
    end

    describe('waiting_uti') do
      it { is_expected.to(allow_value(true).for(:waiting_uti)) }
      it { is_expected.to(allow_value(false).for(:waiting_uti)) }
      it { is_expected.to_not(allow_value(nil).for(:waiting_uti)) }
    end

    describe('admission_date') do
      before { subject.valid? }
      it 'defaults to the current time' do
        expect(subject.admission_date.to_date).to(eq(Date.today))
      end
    end
  end
end
