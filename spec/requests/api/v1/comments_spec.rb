require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments?access_token={access_token}' do
    get 'Get all comments' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, description: 'Author ID'
      parameter name: :post_id, in: :path, type: :string, description: 'Post ID'
      parameter name: :access_token, in: :path, type: :string, description: 'Authentication token'

      response '200', 'comments found' do
        let(:user_id) { User.create(name: 'Andor', photo: 'https://whatsondisneyplus.com/wp-content/uploads/2022/09/andor-avatar.png', bio: 'Rebel fighter from Kenari.An accomplished Alliance Intelligence officer with combat field experience, Captain Cassian Andor commands respect from his Rebel troops with his ability to keep a cool head under fire and complete his missions with minimal resources.', email: 'cassiandor@rebels.com', password: 'cassiandor', password_confirmation: 'cassiandor').id }
        let(:post_id) do
          Post.create(author_id: user_id, title: 'Keep fighting the Empire',
                      text: 'We are close to destroying the Death Star, all rebels come full out').id
        end
        # let(:id) { Comment.create(author_id: :user_id, post_id:, text: 'We will keep on doing so').id }
        let(:access_token) { ApiKey.create.access_token }
        run_test!
      end

      response '404', 'comments not found' do
        let(:user_id) { 'invalid' }
        let(:post_id) { 'invalid' }
        let(:access_token) { ApiKey.create.access_token }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/posts/{post_id}/comments?access_token={access_token}' do
    post 'Create a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string, description: 'Author ID'
      parameter name: :post_id, in: :path, type: :string, description: 'Post ID'
      parameter name: :access_token, in: :path, type: :string, description: 'Authentication token'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }

      response '201', 'comment created' do
        let(:user_id) { User.create(name: 'Maarva Andor', photo: 'https://www.starwarsnewsnet.com/wp-content/uploads/2022/09/Maarva_Poster_Andor-691x1024.jpg', bio: 'A member of the Daughters of Ferrix, Maarva is revered for the sharpness of her mind and firmness of her spirit. Despite the years and her failing health, she has a strong independent streak in her, something she shares with her adopted son, Cassian.', email: 'maarva@rebels.com', password: 'maarva', password_confirmation: 'maarva').id }
        let(:post_id) do
          Post.create(author_id: user_id, title: 'Keep fighting the Empire',
                      text: 'We are close to destroying the Death Star, all rebels come full out').id
        end
        let(:access_token) { ApiKey.create.access_token }
        let(:comment) { { text: 'Hello there I\'m Obu Wan' } }
        run_test!
      end
    end
  end
end
