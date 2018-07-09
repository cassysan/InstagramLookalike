class RemoveCommentsFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :comments, foreign_key: true
  end
end
