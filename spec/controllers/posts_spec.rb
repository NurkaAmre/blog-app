require 'rails_helper'
require 'rails-controller-testing'
Rails::Controller::Testing.install

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/users/:user_id/posts'
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text' do
      get '/users/:user_id/posts'
      expect(response.body).to include('List of posts')
    end
  end
end
