require 'rails_helper'

RSpec.describe FiltersController, :type => :controller do

	describe 'POST #create' do

		before(:each) do
			@user = create(:user)
			session[:user_id] = @user.id
			@filter = create(:filter)
		end 

		it "saves the new filter to db" do
      expect{
        post :create, filter: attributes_for(:filter)
      }.to change(@user.filters, :count).by(1)
		end

	end

end
