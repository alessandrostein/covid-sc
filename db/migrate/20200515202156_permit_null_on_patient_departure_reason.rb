class PermitNullOnPatientDepartureReason < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:patients, :departure_reason, true)
  end
end
