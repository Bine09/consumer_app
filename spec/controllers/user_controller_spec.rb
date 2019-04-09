require 'rails_helper'

describe UsersController, type: :controller do   #indicate that we are testing our  UsersController and tell RSpec that we are testing a controller with type: :controller

# let(:user) { User.create!(email: 'xyz@gmx.de', password:'abcdef') }
# let(:user2) { User.create!(email: 'abc@gmx.de', password:'abcdef') }



before do
  @user = FactoryBot.create(:user)
  @user2 = FactoryBot.create(:user)
end

  describe 'GET #show' do     #want to show user details

      context 'when a user is logged in' do
        before do
          sign_in @user
        end
        it 'loads correct user details' do
          get :show, params: { id: @user.id }            #a Show page always needs an ID so that we know which Show page to access
          expect(response).to be_ok                   #This is shorthand for checking to see if the response contained a 200 status code
          expect(assigns(:user)).to eq @user           #is checking that in our controller we set the @user instance variable to the expected user
        end
      end

      context 'when a user is not logged in' do
        it 'redirects to login' do
          get :show, params: { id: @user.id }            #a Show page always needs an ID so that we know which Show page to access
          expect(response).to redirect_to(root_path)  # expect it to redirect back to new_user_session_path
        end
      end

      context 'signed in user cannot see details of other user' do
        before do
          sign_in @user
        end
        it 'cannot load user2 details' do
          get :show, params: { id: @user2.id }            #a Show page always needs an ID so that we know which Show page to access
          expect(response).to redirect_to(root_path)  # expect it to redirect back to new_user_session_path
        end
      end

      context 'signed in user cannot see details of other user --> forbidden' do
        before do
          sign_in @user
        end
        it 'cannot load user2 details' do
          get :show, params: { id: @user2.id }            #a Show page always needs an ID so that we know which Show page to access
          expect(response).to have_http_status(302)
        end
      end
    end
end
