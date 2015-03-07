class CreateFiltersTable < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.text :slips, array: true
      t.boolean :case_sensitive
      t.boolean :keep_slips_order
      t.timestamps
    end
  end
end
