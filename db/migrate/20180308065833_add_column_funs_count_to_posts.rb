class AddColumnFunsCountToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :funs_count, :integer, default: 0
  end
end
