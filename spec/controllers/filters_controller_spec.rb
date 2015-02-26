require 'rails_helper'

RSpec.describe FiltersController, :type => :controller do

	describe 'POST #create' do

    before(:each) do 
      @filter = attributes_for(:filter)
      @user = attributes_for(:user)
    end

      context 'with valid attributes' do 
        
        it 'saves the new filter to db' do 
          expect{
            post :create, filter: attributes_for(:filter)
          }.to change(Filter, :count).by(1)
        end

        it 'redirects to user_path' do 
          post :create, filter: attributes_for(:filter, user_attributes: @user)
            expect(response).to redirect_to user_path
        end

      end

	end

end
