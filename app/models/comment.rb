class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_save :increment_post_comments_counter

  private

  def increment_post_comments_counter
    post.increment!(:CommentsCounter)
  end
end
