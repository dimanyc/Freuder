class ChangeColumnSlipsInFiltersTableToText < ActiveRecord::Migration
  def change
    change_column :filters, :slips, :text, array: false 
  end
end
