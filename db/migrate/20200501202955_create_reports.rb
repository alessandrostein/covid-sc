class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.references :hospital, null: false, foreign_key: true
      t.datetime :report_date
      t.string :informant_name, null: false, default: ''
      t.string :informant_function, null: false, default: '', limit: 15

      t.timestamps
    end
  end
end
