class ChangeColumnSlipsInFilters < ActiveRecord::Migration
  def change
    change_column :filters, :slips, :text, array: true, default: []
  end
end
