# frozen_string_literal: true
class PatientsController < ApplicationController
  def index
    @hospital = current_user.hospital
    @patients = @hospital.patients
  end

  def show
    @hospital = current_user.hospital
    @patient = @hospital.patients.find(params[:id])
  end

  def new
    @hospital = current_user.hospital
    @patient = @hospital.patients.new
  end

  def edit
    @hospital = current_user.hospital
    @patient = @hospital.patients.find(params[:id])
  end

  def create
    @hospital = current_user.hospital
    @patient = @hospital.patients.new(patient_params)

    if @patient.save
      redirect_to(hospital_patient_url(@patient), notice: 'Patient was successfully created.')
    else
      render(:new)
    end
  end

  def update
    @hospital = current_user.hospital
    @patient = @hospital.patients.find(params[:id])

    if @patient.update(patient_params)
      redirect_to(hospital_patient_url(@patient), notice: 'Patient was successfully updated.')
    else
      render(:edit)
    end
  end

  def destroy
    @hospital = Hospital.find(params[:hospital_id])
    @patient = @hospital.patients.find(params[:id])

    @patient.destroy
    redirect_to(patients_url, notice: 'Patient was successfully destroyed.')
  end

  private

  def patient_params
    params.require(:patient).permit(
      :full_name,
      :birthday,
      :hospitalization_date,
      :cns,
      :sisreg,
      :airways,
      :status,
      :departure_date,
      :departure_reason,
    ).merge(hospital: @hospital)
  end
end
