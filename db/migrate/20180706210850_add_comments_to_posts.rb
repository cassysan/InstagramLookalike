class AddCommentsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :comments, foreign_key: true
  end
end
