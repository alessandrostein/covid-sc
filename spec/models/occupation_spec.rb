# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(Occupation, type: :model) do
  context('when valid') do
    subject { build(:occupation) }

    it { is_expected.to(be_valid) }
  end

  context('associations') do
    it { should belong_to(:report) }
  end

  context 'attributes' do
    subject { Occupation.new }

    describe('total') do
      it { is_expected.to(validate_presence_of(:total)) }
      it { is_expected.to(allow_value(1).for(:total)) }
    end

    describe('total_covid') do
      it { is_expected.to(validate_presence_of(:total_covid)) }
      it { is_expected.to(allow_value(1).for(:total_covid)) }
    end

    describe('occupation') do
      it { is_expected.to(validate_presence_of(:occupation)) }
      it { is_expected.to(allow_value(1).for(:occupation)) }
    end

    describe('occupation_covid') do
      it { is_expected.to(validate_presence_of(:occupation_covid)) }
      it { is_expected.to(allow_value(1).for(:occupation_covid)) }
    end

    describe('total_waiting_uti') do
      it { is_expected.to(validate_presence_of(:total_waiting_uti)) }
      it { is_expected.to(allow_value(1).for(:total_waiting_uti)) }
    end
  end
end
