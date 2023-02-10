require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/users?access_token={access_token}' do
    get 'List all Users' do
      tags 'Users', 'All Users'
      produces 'application/json'
      parameter name: :access_token, in: :path, type: :string, description: 'Authentication token'

      response '200', 'successful' do
        let(:access_token) { ApiKey.create.access_token }
        run_test!
      end

      response '401', 'restrited access, no access_token provided' do
        let(:access_token) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}?access_token={access_token}' do
    get 'Show single post of User' do
      tags 'Users', 'Single User'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'Author ID'
      parameter name: :access_token, in: :path, type: :string, description: 'Authentication token'

      response '200', 'user found' do
        let(:id) { User.create(name: 'Sergeant Linus Mosk', photo: 'https://pbs.twimg.com/media/FdTUjpUWQAEzO0n.jpg:large', bio: 'Sergeant Linus Mosk was a human male who served in Preox-Morlana\'s Pre-Mor Enforcement. Following the murder of two Preox-Morlana employees in 5 BBY, Mosk was summoned to Corporate Security Headquarters on the planet Morlana One to meet with Deputy Inspector Syril Karn.', email: 'linusmosk@empire.com', password: 'linusmosk', password_confirmation: 'linusmosk').id }
        let(:access_token) { ApiKey.create.access_token }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        let(:access_token) { ApiKey.create.access_token }
        run_test!
      end
    end
  end
end