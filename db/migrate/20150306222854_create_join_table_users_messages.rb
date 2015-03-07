class CreateJoinTableUsersMessages < ActiveRecord::Migration
  def change
    create_join_table :users, :messages do |t|
      t.index [:user_id, :message_id]
      t.index [:message_id, :user_id]
    end
  end
end
