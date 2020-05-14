# frozen_string_literal: true
class ReportsController < ApplicationController
  def create
    Report.create!(
      user: current_user,
      hospital: current_user.hospital,
      informant_name: 'NÃO INFORMADO',
      informant_function: 'NÃO INFORMADO'
    )

    redirect_to(hospital_path, notice: 'Informe enviado com sucesso!')
  end
end
