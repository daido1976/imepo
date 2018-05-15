class AddColumnScaresCountToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :scares_count, :integer, default: 0
  end
end
