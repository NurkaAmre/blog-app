class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :increment_likes_counter

  private

  def increment_likes_counter
    post.increment!(:likes_counter)
  end
end
