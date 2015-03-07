class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username 
      t.string :email 
      t.integer :uid
      t.string :provider
      t.string :image_url
      t.timestamps
    end
  end
end
