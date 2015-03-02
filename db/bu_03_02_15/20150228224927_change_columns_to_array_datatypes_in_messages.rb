class ChangeColumnsToArrayDatatypesInMessages < ActiveRecord::Migration
  def change
    change_column :messages, :slipped, "varchar[] USING (string_to_array(slipped, ','))"
    change_column :messages, :hashtags, "varchar[] USING (string_to_array(hashtags, ','))"
    change_column :messages, :mentions, "varchar[] USING (string_to_array(mentions, ','))"
    change_column :messages, :slipped, :text, array: true, default: []
    change_column :messages, :hashtags, :text, array: true, default: []
    change_column :messages, :mentions, :text, array: true, default: []
  end
end
