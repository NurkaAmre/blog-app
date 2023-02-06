require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'User index page process' do
    before(:each) do
      @user = User.create(name: 'Amre', photo: 'https://google.com/amirr.jpg', bio: 'I am a scientist Amre',
                          PostCounter: 2)
      visit users_path
    end

    it 'should show the username of all other users' do
      expect(page).to have_content(@user.name)
    end

    it 'should show the photo of all other users' do
      expect(page.body).to include(@user.photo)
    end

    it 'should show the number of posts of all other users' do
      expect(page.body).to include(@user.PostCounter.to_s)
    end

    it "When I click See details, should redirected to that user's show page." do
      click_link("See details")
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
end