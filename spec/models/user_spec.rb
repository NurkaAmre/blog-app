require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 5
    )
  end

  before { subject.save }

  it { should have_many :posts }
  it { should have_many :comments }
  it { should have_many :likes }
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:PostsCounter) }

  it 'Should output 0 to 3 last comment when recent_posts is called' do
    expect(subject.recent_posts.length).to be_between(0, 3)
  end
end
