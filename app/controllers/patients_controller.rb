class PatientsController < ApplicationController
  def index
    @hospital = current_account.hospital
    @patients = @hospital.patients
  end

  def show
    @hospital = current_account.hospital
    @patient = @hospital.patients.find(params[:id])
  end

  def new
    @hospital = current_account.hospital
    @patient = @hospital.patients.new
  end

  def edit
    @hospital = current_account.hospital
    @patient = @hospital.patients.find(params[:id])
  end

  def create
    @hospital = current_account.hospital
    @patient = @hospital.patients.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @hospital = Hospital.find(params[:hospital_id])
    @patient = @hospital.patients.find(params[:id])

    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hospital = Hospital.find(params[:hospital_id])
    @patient = @hospital.patients.find(params[:id])

    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def patient_params
      params.require(:patient).permit(:id, :hospital_id)
    end
end
