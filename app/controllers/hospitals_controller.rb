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

    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to @hospital, notice: 'Hospital was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital }
      else
        format.html { render :edit }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def hospital_params
      params.require(:hospital).permit(:acronym, :name, :city, :phone_number, :email)
    end
end
