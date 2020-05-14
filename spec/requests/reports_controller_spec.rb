# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(ReportsController, type: :request) do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe 'POST #create' do
    subject { post report_path }

    it 'returns http success' do
      is_expected.to(redirect_to(hospital_path))
    end
  end
end
