class ChangeColumnsInFiltersToArrayDatatypes < ActiveRecord::Migration
  def change
    change_column :filters, :slips, "varchar[] USING (string_to_array(slips, ','))"
  end
end
