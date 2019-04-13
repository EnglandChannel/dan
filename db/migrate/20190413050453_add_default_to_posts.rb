class AddDefaultToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :user_id, :integer, :default => 1
  end
end
