class AddSharesAndLikesToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sharers, :text, array: true, default: "[]"
    add_column :posts, :likers, :text, array: true, default: "[]"
    add_index :posts, :sharers
    add_index :posts, :likers
  end
end
