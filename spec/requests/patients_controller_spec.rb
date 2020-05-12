require 'rails_helper'

RSpec.describe PatientsController, type: :request do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_hospital_patient_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
  let(:patient) { create(:patient, hospital: user.hospital) }

  it 'returns http success' do
    get hospital_patient_path(patient)
    expect(response).to have_http_status(:success)
  end
end

  describe 'GET #edit' do
    let(:patient) { create(:patient, hospital: user.hospital) }

    it 'returns http success' do
      get edit_hospital_patient_path(patient)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:patient) { build(:patient, hospital: user.hospital) }

    it 'returns http redirect' do
      post hospital_patients_path, params: {
        patient: {
          full_name: patient.full_name,
          birthday: patient.birthday,
          hospitalization_date: patient.hospitalization_date,
          cns: patient.cns,
          sisreg: patient.sisreg,
          airways: patient.airways,
          status: patient.status,
          departure_date: patient.departure_date,
          departure_reason: patient.departure_reason,
        }
      }

      expect(response).to have_http_status(:redirect)
      expect(Patient.count).to eq(1)
    end

    it 'returns http success with invalid data' do
      post hospital_patients_path, params: {
        patient: {
          full_name: patient.full_name
        }
      }

      expect(response).to have_http_status(:success)
      expect(Patient.count).to be_zero
    end
  end

  describe 'PATCH #update' do
    let(:patient) { create(:patient, hospital: user.hospital) }

    it 'returns http redirect' do
      patch hospital_patient_path(patient), params: {
        patient: {
          full_name: patient.full_name,
          birthday: patient.birthday,
          hospitalization_date: patient.hospitalization_date,
          cns: patient.cns,
          sisreg: patient.sisreg,
          airways: patient.airways,
          status: patient.status,
          departure_date: patient.departure_date,
          departure_reason: patient.departure_reason,
        }
      }

      expect(response).to have_http_status(:redirect)
    end

    it 'returns http success with invalid data' do
      patch hospital_patient_path(patient), params: {
        patient: {
          full_name: ''
        }
      }

      expect(response).to have_http_status(:success)
    end
  end
end
