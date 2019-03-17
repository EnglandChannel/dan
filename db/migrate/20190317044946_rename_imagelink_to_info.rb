class RenameImagelinkToInfo < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :imagelink, :info
  end
end
