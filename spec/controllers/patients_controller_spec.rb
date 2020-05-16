# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(PatientsController, type: :controller) do
  before :all do
    hospital = create(:hospital)
    Hospital.current_id = hospital.id
    @user = create(:user, hospital_id: hospital.id)
    @patients = create_list(:patient, 10)
  end
  describe "GET index with scoped" do
    it 'assigns @patients' do
      sign_in @user

      get :index

      expect(assigns(:patients)).to(eq(@patients))
    end
  end
end