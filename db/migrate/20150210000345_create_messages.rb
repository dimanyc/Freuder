class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.string :author
      t.string :hashtags
      t.string :author_image_url
      t.string :mentions
      t.text :slipped
      t.references :owner, polymorphic: true, index: true

      t.timestamps
    end
  end
end
