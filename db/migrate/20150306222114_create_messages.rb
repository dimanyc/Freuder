class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.string :author
      t.string :author_image_url
      t.text :hashtags, array: true      
      t.text :mentions, array: true
      t.text :slipped, array: true      
      t.timestamps      
    end
  end
end
