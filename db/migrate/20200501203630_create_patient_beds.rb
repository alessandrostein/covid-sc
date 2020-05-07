class CreatePatientBeds < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_beds do |t|
      t.references :patient, null: false, foreign_key: true
      t.integer :bed_type, null: false, default: 0
      t.datetime :admission_date
      t.boolean :waiting_uti, null: false, default: false

      t.timestamps
    end
  end
end
