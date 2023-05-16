class RemoveUserImageIdFromBookComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :book_comments, :user_image_id, :integer
  end
end
