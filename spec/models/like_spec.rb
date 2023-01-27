require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should belong_to :post }
  it { should belong_to :author }

  it 'Post likes counter can be set' do
    subject.post = Post.new(author: @user, title: 'Post One', text: 'This is the post one')
    subject.send(:increment_likes_counter)
    expect(subject.post.LikesCounter).to be(1)
  end
end
