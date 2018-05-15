class AddColumnWorstsCountToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :worsts_count, :integer, default: 0
  end
end
