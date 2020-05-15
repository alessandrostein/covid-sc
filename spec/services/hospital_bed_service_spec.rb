# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(HospitalBedService) do
  describe '.create_beds!' do
    let(:hospital) { create(:hospital) }

    context 'create hospital beds for a given hospital' do
      subject { described_class.new(hospital_id: hospital.id) }

      it 'should create all hospital beds for a given hospital' do
        expect { subject.create_beds! }.to(change { HospitalBed.all.count })
      end
    end

    context 'do nothing if hospital id was not given' do
      subject { described_class.new(hospital_id: nil) }
      it 'do nothing' do
        expect { subject.create_beds! }.not_to(change { HospitalBed.all.count })
      end
    end
  end
end
