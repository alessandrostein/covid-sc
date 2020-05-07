class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.references :hospital, null: false, foreign_key: true
      t.string :full_name, null: false, default: ''
      t.datetime :birthday
      t.integer :airways, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.datetime :hospitalization_date
      t.datetime :departure_date
      t.string :cns, null: false, default: ''
      t.string :sisreg, null: false, default: ''
      t.integer :departure_reason, null: false, default: 0

      t.timestamps
    end
  end
end
