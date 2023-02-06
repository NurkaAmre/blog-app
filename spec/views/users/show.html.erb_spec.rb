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

    it 'should show the user profile picture' do
      expect(page.body).to include(@user.photo)
    end

    it 'should show the user username' do
      expect(page.body).to have_content(@user.name)
    end

    it 'should show the number of post the user has writen' do
      expect(page.body).to have_content(@user.PostCounter.to_s)
    end

    it 'should sho wthe the users bio' do
      expect(page.body).to have_content(@user.bio)
    end
  end
end