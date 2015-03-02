class ChangeMessageColumnTypesToArrays < ActiveRecord::Migration
  def change
    change_column :messages, :slipped, :text, array: true, default: []
    change_column :messages, :hashtags, :text, array: true, default: []
    change_column :messages, :mentions, :text, array: true, default: []    
  end
end
