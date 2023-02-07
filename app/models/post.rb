class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_save :increment_posts_counter

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :LikesCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :CommentsCounter, numericality: { greater_than_or_equal_to: 0 }

  def increment_posts_counter
    author.increment!(:PostCounter)
  end

  def recent_comments
    comments.includes(:author).order(created_at: :desc).limit(5)
  end
end
