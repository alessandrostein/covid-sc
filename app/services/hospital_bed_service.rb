# frozen_string_literal: true
class HospitalBedService
  def initialize(params = {})
    @hospital_id = params.fetch(:hospital_id)
  end

  def create_beds!
    return unless @hospital_id.present?
    HospitalBed.bed_types.keys.map { |bed_type| create_bed(bed_type) }
  end

  def create_bed(bed_type)
    HospitalBed.create(
      hospital_id: @hospital_id,
      bed_type: bed_type,
      total: 0,
      total_covid: 0,
    )
  end
end
