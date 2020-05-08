class HospitalsController < ApplicationController
  def show
    @hospital = current_user.hospital
    @patients = @hospital.patients.limit(10)
  end

  def edit
    @hospital = current_user.hospital
  end

  def update
    @hospital = current_user.hospital

    if @hospital.update(hospital_params)
      redirect_to @hospital, notice: 'Hospital was successfully updated.'
    else
      render :edit
    end
  end

  private

    def hospital_params
      params.require(:hospital).permit(:acronym, :name, :city, :phone_number, :email)
    end
end
