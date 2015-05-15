class CorrectTables < ActiveRecord::Migration
  def change
    rename_column :bands_venues, :employee_id, :band_id
  end
end
