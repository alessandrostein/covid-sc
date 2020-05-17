# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(PatientsController, type: :controller) do
  before :all do
    hospital = create(:hospital)
    Hospital.current_id = hospital.id
    @user = create(:user, hospital_id: hospital.id)
   
  end
  describe "GET index with scoped" do
    it 'assigns @patients' do
      patients = create_list(:patient, 10)

      sign_in @user

      get :index

      expect(assigns(:patients)).to(eq(patients))
    end
  end
end