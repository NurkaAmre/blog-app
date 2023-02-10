require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do
  path '/api/v1/users/{user_id}/posts?access_token={access_token}' do
    get 'List all posts for a User' do
      tags 'Posts', 'All Posts'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, description: 'Author ID'
      parameter name: :access_token, in: :path, type: :string, description: 'Authentication token'

      response '200', 'successful' do
        let(:user_id) { User.create(name: 'Syril Karn', photo: 'https://lumiere-a.akamaihd.net/v1/images/syril-karn-main-a_da01439f.jpeg?region=0%2C51%2C1920%2C960', bio: 'Syril Karn believes wholeheartedly in order and justice. The ambitious inspector hopes to make a name for himself within the ranks of the Empire by quelling signs of rebellious activity and exposing lawbreakers.', email: 'syrilkarn@empire.com', password: 'syrilkarn', password_confirmation: 'syrilkarn').id }
        let(:access_token) { ApiKey.create.access_token }
        run_test!
      end

      response '404', 'posts not found' do
        let(:user_id) { 'invalid' }
        let(:access_token) { ApiKey.create.access_token }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/posts/{id}?access_token={access_token}' do
    get 'Show single post of User' do
      tags 'Posts', 'Single Post'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, description: 'Author ID'
      parameter name: :id, in: :path, type: :string, description: 'Post ID'
      parameter name: :access_token, in: :path, type: :string, description: 'Authentication token'

      response '200', 'post found' do
        let(:user_id) { User.create(name: 'Bix Caleen', photo: 'https://lumiere-a.akamaihd.net/v1/images/bix-caleen-main-b_1450fe71.jpeg?region=103%2C0%2C1427%2C803&width=960', bio: 'Bix Caleen was a human female and mechanic who was the owner of the Caleen Salyard on the Free Trade sector planet of Ferrix. She worked alongside Timm Karlo, who was also her lover. She was close with her ex-boyfriend, Cassian Andor, who trusted her greatly. She also had offworld connections, namely Luthen Rael.', email: 'bixcaleen@rebels.com', password: 'bixcaleen', password_confirmation: 'bixcaleen').id }
        let(:id) do
          Post.create(author_id: user_id, title: 'Keep fighting the Empire',
                      text: 'We are close to destroying the Death Star, all rebels come full out').id
        end
        let(:access_token) { ApiKey.create.access_token }
        run_test!
      end

      response '404', 'post not found' do
        let(:user_id) { User.create(name: 'Bix Caleen', photo: 'https://lumiere-a.akamaihd.net/v1/images/bix-caleen-main-b_1450fe71.jpeg?region=103%2C0%2C1427%2C803&width=960', bio: 'Bix Caleen was a human female and mechanic who was the owner of the Caleen Salyard on the Free Trade sector planet of Ferrix. She worked alongside Timm Karlo, who was also her lover. She was close with her ex-boyfriend, Cassian Andor, who trusted her greatly. She also had offworld connections, namely Luthen Rael.', email: 'bixcaleen@rebels.com', password: 'bixcaleen', password_confirmation: 'bixcaleen').id }
        let(:id) { 'invalid' }
        let(:access_token) { ApiKey.create.access_token }
        run_test!
      end
    end
  end
end
