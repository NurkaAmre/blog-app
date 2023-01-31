require 'rails-helper'

RSpec.describe UsersController do
    describe 'GET index' do
        it 'assigns @users' do
            user = User.created_at
            get :index
            expect(assigns(:users)).to eq([user])
        end
    end
end
