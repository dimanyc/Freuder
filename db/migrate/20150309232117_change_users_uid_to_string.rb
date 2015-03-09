class ChangeUsersUidToString < ActiveRecord::Migration
  def change
    change_column :uid, :users, :string
  end
end
