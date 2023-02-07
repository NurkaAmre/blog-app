require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  describe 'Post index page process' do
    before(:each) do
      @user = User.create(name: 'Nurka', photo: 'https://i.imgur.com/nur.jpg', bio: 'I am Amre mother',
                          PostCounter: 2)
      @user2 = User.create(name: 'Amre', photo: 'https://i.imgur.com/amir.jpg', bio: 'I am Nurka son',
                           PostCounter: 3)
      @first_post = Post.create(author: @user, title: 'My first post', text: 'This is my first post',
                                CommentsCounter: 0, LikesCounter: 0)
      Comment.create(post: @first_post, author: @user2, text: 'This the first post comment')

      visit user_posts_path(@user)
    end

    it 'should show the user profile picture' do
      expect(page.body).to include(@user.photo)
    end

    it 'should show the user username' do
      expect(page.body).to have_content(@user.name)
    end

    it 'should show the number of post the user has writen' do
      expect(page.body).to have_content(@user.PostCounter.to_s)
    end

    it "I can see post's title" do
      expect(page.body).to have_content(@first_post.title)
    end

    it "should some of the post's body" do
      expect(page.body).to have_content(@first_post.text)
    end

    it 'should show the first comments on a post' do
      expect(page.body).to have_content('This the first post comment')
    end

    it 'should show how many comments a post has' do
      expect(page.body).to have_content(@first_post.CommentsCounter.to_s)
    end

    it 'should show how many likes a post has.' do
      expect(page.body).to have_content(@first_post.LikesCounter.to_s)
    end

    it 'should not show a pagination button' do
      expect(page.body).not_to have_content('Pagination')
    end

    it "When I click on a 'All comments' it should redirects to that post's show page" do
      click_link('All comments')
      expect(page).to have_current_path(user_post_path(@user, @first_post))
    end

    it 'redirects to posts show page' do
      click_on 'All comments'
      expect(page).to have_current_path user_post_path(@user.id, @post.id)
    end
  end
end
