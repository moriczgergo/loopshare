class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :author
      t.text :content
      t.text :media, array: true, default: "[]"
      t.integer :parent
      t.timestamps
    end
  end
end
