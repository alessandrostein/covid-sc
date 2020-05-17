# frozen_string_literal: true
require 'rails_helper'

RSpec.describe(HospitalsController, type: :controller) do
  describe "GET index" do
    it 'assigns @hospitals and @patients' do
      hospital = create(:hospital)
      patients = create_list(:patient, 10, hospital_id: hospital.id)
      create(:patient, hospital_id: hospital.id, departure_reason: Patient.departure_reasons.keys.sample)
      user = create(:user, hospital_id: hospital.id)

      sign_in(user)

      get :show

      expect(assigns(:hospital)).to(eq(hospital))
      expect(assigns(:patients)).to(eq(patients))
    end
  end
end
