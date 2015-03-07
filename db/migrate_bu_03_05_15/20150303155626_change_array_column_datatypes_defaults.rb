class ChangeArrayColumnDatatypesDefaults < ActiveRecord::Migration
 def change
    change_column :messages, :slipped, :text, array: true
    change_column :messages, :hashtags, :text, array: true
    change_column :messages, :mentions, :text, array: true
  end
end
