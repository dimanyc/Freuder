class CreateJoinTableFiltersMessages < ActiveRecord::Migration
  def change
    create_join_table :filters, :messages do |t|
      t.index [:filter_id, :message_id]
      t.index [:message_id, :filter_id]
    end
  end
end
