class AddPrivateToHospital < ActiveRecord::Migration[6.0]
  def change
    add_column :hospitals, :private, :boolean, null: false, default: false
  end
end
