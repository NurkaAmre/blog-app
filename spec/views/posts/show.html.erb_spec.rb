require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  describe 'Post show page process' do
    before(:each) do
      @user = User.create(name: 'Nurka', photo: 'https://i.imgur.com/nur.jpg', bio: 'I am a Amre\'s mother',
                          PostCounter: 2)
      @user2 = User.create(name: 'Amre', photo: 'https://i.imgur.com/amir.jpg', bio: 'I am a Nurka\'s son',
                           PostCounter: 3)
      @first_post = Post.create(author: @user, title: 'My first post', text: 'This is my first post',
                                CommentsCounter: 0, LikesCounter: 0)
      Comment.create(post: @first_post, author: @user2, text: 'This the first post comment')

      visit user_post_path(@user, @first_post)
    end

    it "should show a post's title" do
      expect(page.body).to have_content(@first_post.text)
    end

    it 'should show who wrote the post' do
      expect(page.body).to have_content(@first_post.author.name)
    end

    it 'should show how many comments it has' do
      expect(page.body).to have_content(@first_post.CommentsCounter.to_s)
    end

    it 'should show how many likes it has' do
      expect(page.body).to have_content(@first_post.LikesCounter.to_s)
    end

    it 'should show the post body' do
      expect(page.body).to have_content(@first_post.text)
    end

    it 'should show the username of each commentor' do
      expect(page.body).to have_content(@user2.name)
    end

    it 'should show the comment body' do
      expect(page.body).to have_content('This the first post comment')
    end
  end
end
