class AddAmountToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :amount, :integer, default: 1
  end
end
