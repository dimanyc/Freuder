require 'rails_helper'

RSpec.describe FiltersController, :type => :controller do

	describe 'POST #create' do

    before(:each) do 
      @user = create(:user, id: 1)
    end

      context 'with valid attributes' do 
      
        it "creates new Filter" do
          expect{
          post :create, user_id: 1, filter: attributes_for(:filter)
          }.to change(Filter, :count).by(1)
        end

        it "redirects_to user_path" do 
          post :create, user_id: 1, filter: attributes_for(:filter)
          expect(response).to redirect_to user_path(@user)
        end

      end

	end

end
