require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'POST #create' do 
    context 'with valid attributes' do 
      
      it 'creates the User' do
        post :create, user: attributes_for(:user), format: :html, format: :json #< does this work? 
        expect(User.count).to eq(1)
      end

      it 'redirects to the "show" action for the new user' do 
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to User.first
      end

    end
  end
end

  