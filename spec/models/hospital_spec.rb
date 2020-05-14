# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(Hospital, type: :model) do
  context('when valid') do
    subject { build(:hospital) }

    it { is_expected.to(be_valid) }
  end

  context('associations') do
    it { should have_many(:users) }
    it { should have_many(:patients) }
    it { should have_many(:reports) }
    it { should have_many(:hospital_beds) }
  end

  context 'attributes' do
    subject { Hospital.new }

    describe('acronym') do
      it { is_expected.to(validate_presence_of(:acronym)) }
      it { is_expected.to(allow_value('HMSJ').for(:acronym)) }
      it { is_expected.to(validate_length_of(:acronym).is_at_most(8)) }
    end

    describe('name') do
      it { is_expected.to(validate_presence_of(:name)) }
      it { is_expected.to(allow_value('Hospital São José').for(:name)) }
      it { is_expected.to(validate_length_of(:name).is_at_most(256)) }
    end

    describe('city') do
      it { is_expected.to(validate_presence_of(:city)) }
      it { is_expected.to(allow_value('Joinville').for(:city)) }
    end

    describe('city') do
      it { is_expected.to(allow_value('Joinville').for(:city)) }
    end

    describe('phone_number') do
      it { is_expected.to(allow_value('(47) 99122-3355').for(:phone_number)) }
      it { is_expected.to(allow_value('47991223355').for(:phone_number)) }
      it { is_expected.to_not(allow_value('99122-3355').for(:phone_number)) }
      it { is_expected.to_not(allow_value('991223355').for(:phone_number)) }
      it { is_expected.to_not(allow_value('9912233').for(:phone_number)) }
      it { is_expected.to_not(allow_value('abc').for(:phone_number)) }
    end

    describe('email') do
      it { is_expected.to(validate_presence_of(:email)) }
      it { is_expected.to(allow_value('marvin@magrathealabs.com').for(:email)) }
      it { is_expected.to_not(allow_value('email@example').for(:email)) }
      it { is_expected.to_not(allow_value('email').for(:email)) }
      it { is_expected.to_not(allow_value('').for(:email)) }
    end
  end
end
