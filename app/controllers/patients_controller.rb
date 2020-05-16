# frozen_string_literal: true
class PatientsController < ApplicationController
  def index
    @hospital = current_user.hospital
    @patients = @hospital.patients.paginate(page: params[:page], per_page: 10)
  end

  def show
    @hospital = current_user.hospital
    @patient = @hospital.patients.find(params[:id])
  end

  def new
    @hospital = current_user.hospital
    @patient = @hospital.patients.new
    @patient.build_patient_bed
  end

  def edit
    @hospital = current_user.hospital
    @patient = @hospital.patients.find(params[:id])
    @patient.build_patient_bed if @patient.patient_bed.blank?
  end

  def create
    @hospital = current_user.hospital
    @patient = @hospital.patients.new(
      patient_params.merge(
        patient_bed_attributes: {
          admission_date: patient_params[:hospitalization_date],
        }
      )
    )

    if @patient.save
      redirect_to(patient_url(@patient), notice: 'Patient was successfully created.')
    else
      render(:new)
    end
  end

  def update
    @hospital = current_user.hospital
    @patient = @hospital.patients.find(params[:id])

    if @patient.update(patient_params)
      redirect_to(patient_url(@patient), notice: 'Patient was successfully updated.')
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
      patient_bed_attributes: [:id, :patient_id, :waiting_uti, :bed_type]
    ).merge(hospital: @hospital)
  end
end
