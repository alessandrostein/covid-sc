class CreateOccupations < ActiveRecord::Migration[6.0]
  def change
    create_table :occupations do |t|
      t.references :report, null: false, foreign_key: true
      t.integer :bed_type, null: false, default: 0
      t.integer :total, null: false, default: 0
      t.integer :total_covid, null: false, default: 0
      t.integer :occupation, null: false, default: 0
      t.integer :occupation_covid, null: false, default: 0
      t.integer :total_waiting_uti, null: false, default: 0

      t.timestamps
    end
  end
end
