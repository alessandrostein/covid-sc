class DropReportDate < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :report_date
  end
end
