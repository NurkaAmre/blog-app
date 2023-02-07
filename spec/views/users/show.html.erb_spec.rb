require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  describe 'User show page process' do
    before(:each) do
      @user = User.create(name: 'Nurka', photo: 'https://google.com/nur.jpg', bio: 'Asks tasks',
                          PostCounter: 2)
      Post.create(author: @user, title: 'My first post', text: 'This is my first post')
      Post.create(author: @user, title: 'My second post', text: 'This is my second post')
      Post.create(author: @user, title: 'My third post', text: 'This is my third post')
      @last_post = Post.create(author: @user, title: 'My fourth post', text: 'This is my fourth post')

      visit user_path(@user.id)
    end

    it 'I can see the user\'s profile picture' do
      expect(page.body).to include(@user.photo)
    end

    it 'I can see the user\'s username.' do
      expect(page.body).to have_content(@user.name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page.body).to have_content(@user.PostCounter.to_s)
    end

    it 'I can see the user\'s bio' do
      expect(page.body).to have_content(@user.bio)
    end

    it "I can see a button that lets me view all of a user's posts" do
      expect(page.body).to have_content('See all posts')
    end

    it "When I click to see all posts button, it should redirects me to the user's post's index page" do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
