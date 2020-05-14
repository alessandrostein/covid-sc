# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(User, type: :model) do
  describe('factory') do
    context('when valid') do
      subject { build(:user) }

      it { is_expected.to(be_valid) }
    end
  end

  context('associations') do
    let(:user) { build(:user) }

    it { should belong_to(:hospital).optional(true) }

    context 'admin user cant have a hospital' do
      let(:invalid_admin_user) { build(:admin) }
      let(:valid_admin_user) { build(:admin, hospital: nil) }

      it { expect(invalid_admin_user).to_not(be_valid) }
      it { expect(valid_admin_user).to(be_valid) }
    end
  end

  context 'attributes' do
    describe('email') do
      it { is_expected.to(validate_presence_of(:email)) }
      it { is_expected.to(allow_value('test@email.com').for(:email)) }
      it { is_expected.to_not(allow_value('email').for(:email)) }
      it { is_expected.to_not(allow_value('').for(:email)) }

      context('when email not unique') do
        let(:first_user) { create(:user) }
        subject { User.new(email: first_user.email) }

        it { is_expected.to(validate_uniqueness_of(:email).case_insensitive) }
      end
    end

    describe('password') do
      it { is_expected.to(validate_presence_of(:password)) }
      it { is_expected.to(validate_confirmation_of(:password)) }
    end

    describe('role') do
      it { is_expected.to(validate_presence_of(:role)) }
    end
  end
end
