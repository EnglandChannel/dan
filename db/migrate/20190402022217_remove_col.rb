class RemoveCol < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :branch_id
  end
end
