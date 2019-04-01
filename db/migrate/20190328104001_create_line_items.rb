class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :post_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
