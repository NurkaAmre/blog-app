require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.new(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      PostsCounter: 3
    )
  end

  let(:post) do
    Post.new(
      author: user,
      title: 'Hello',
      text: 'This is my first post',
      CommentsCounter: 1,
      LikesCounter: 1
    )
  end

  it { should belong_to :author }
  it { should have_many :comments }
  it { should have_many :likes }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }
  it { should validate_numericality_of(:CommentsCounter) }
  it { should validate_numericality_of(:LikesCounter) }

  it 'User post counter to increment' do
    subject.author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    subject.send(:increment_posts_counter)
    expect(subject.author.PostsCounter).to be(1)
  end

  it 'Should output 0 to 5 last comment when last_five_comments is called' do
    expect(post.recent_comments.length).to be_between(0, 5)
  end
end
