# frozen_string_literal: true
class HospitalsController < ApplicationController
  def show
    @hospital = current_user.hospital
    @patients = @hospital.patients.active.limit(10)
  end

  def edit
    @hospital = current_user.hospital
    @hospital_beds = @hospital.hospital_beds
  end

  def update
    update_hospital_beds

    @hospital = current_user.hospital

    if @hospital.update(hospital_params)
      redirect_to(@hospital, notice: 'Hospital was successfully updated.')
    else
      render(:edit)
    end
  end

  private

  def update_hospital_beds
    params.require(:hospital_beds).each do |id, payload|
      current_user.hospital.hospital_beds.find(id).update!(payload.permit(:total, :total_covid))
    end
  end

  def hospital_params
    params.require(:hospital).permit(:acronym, :name, :city, :phone_number, :email)
  end
end
