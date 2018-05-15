class AddColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :status, :integer, default: 0
    add_column :posts, :stock, :integer
    add_column :posts, :price, :integer
  end
end
