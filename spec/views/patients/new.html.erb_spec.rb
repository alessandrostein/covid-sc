require 'rails_helper'

RSpec.describe "patients/new", type: :view do
  let(:patient) { Patient.new(hospital: create(:hospital)) }
  let(:hospital) { patient.hospital }

  it 'rernder form attributes' do
    assign(:patient, patient)
    assign(:hospital, hospital)

    render

    expect(rendered).to match /Novo Paciente/
    expect(rendered).to match /Nome completo/
    expect(rendered).to match /Data de nacimento/
    expect(rendered).to match /Data de Hospitalização/
    expect(rendered).to match /Carteira Nacional do SUS/
    expect(rendered).to match /Sisreg/
    expect(rendered).to match /Ventilação/
    expect(rendered).to match /Status/
    expect(rendered).to match /Data de saída/
    expect(rendered).to match /Motivo da saída/
  end
end
