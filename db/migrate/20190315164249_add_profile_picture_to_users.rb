class AddProfilePictureToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_pic_data, :text
  end
end
