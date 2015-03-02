class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username 
      t.string :email # will be empty for a while. Twitter has been working on adding `email` to auth hash: http://bit.ly/1D5Rgwq
      t.integer :uid
      t.string :provider
      t.string :image_url
      t.timestamps
    end
  end
end
