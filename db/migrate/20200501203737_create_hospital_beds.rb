class CreateHospitalBeds < ActiveRecord::Migration[6.0]
  def change
    create_table :hospital_beds do |t|
      t.references :hospital, null: false, foreign_key: true
      t.integer :bed_type, null: false, default: 0
      t.integer :total, null: false, default: 0
      t.integer :total_covid, null: false, default: 0

      t.timestamps
    end
  end
end
