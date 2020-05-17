# frozen_string_literal: true
require 'rails_helper'

RSpec.describe("patients/edit", type: :view) do
  let(:patient) { create(:patient) }
  let(:hospital) { patient.hospital }

  it 'rernder form attributes' do
    assign(:patient, patient)
    assign(:hospital, hospital)

    render

    expect(rendered).to(match(patient.full_name))
    expect(rendered).to(match(patient.cns))
    expect(rendered).to(match(patient.sisreg))

    expect(rendered).to(match(/Editar Paciente/))
    expect(rendered).to(match(/Nome completo/))
    expect(rendered).to(match(/Data de nacimento/))
    expect(rendered).to(match(/Data de Hospitalização/))
    expect(rendered).to(match(/Carteira do SUS/))
    expect(rendered).to(match(/Sisreg/))
    expect(rendered).to(match(/Ventilação/))
    expect(rendered).to(match(/Status/))
    expect(rendered).to(match(/Data de Movimentação/))
    expect(rendered).to(match(/Motivo da Movimentação/))
  end
end
