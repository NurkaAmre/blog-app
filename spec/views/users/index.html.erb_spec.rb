require 'rails_helper'
RSpec.describe 'User index page', type: :feature do
  describe 'User index page process' do
    before(:each) do
      @user = User.create(name: 'Amre', photo: 'https://google.com/amir.jpg', bio: 'I am a scientist Amre',
                          PostCounter: 2)
      visit users_path
    end
    it 'I can see the username of all other users' do
      expect(page).to have_content(@user.name)
    end
    it 'I can see the profile picture for each user.' do
      expect(page.body).to include(@user.photo)
    end
    it 'I can see the number of posts each user has written.' do
      expect(page.body).to include(@user.PostCounter.to_s)
    end
    it "When I click See details button, it should redirected to that user's show page." do
      click_link('See details')
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
end
