class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  after_save :increment_likes_counter

  private

  def increment_likes_counter
    post.increment!(:LikesCounter)
  end
end
