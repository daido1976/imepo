class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :comment
      t.string :image
      t.references :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
