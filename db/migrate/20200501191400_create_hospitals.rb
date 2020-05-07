class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :acronym, null: false, default: ''
      t.string :name, null: false, default: ''
      t.string :city, null: false, default: ''
      t.string :phone_number, null: false, default: '', limit: 15
      t.string :email, null: false, default: ''

      t.timestamps
    end
  end
end
