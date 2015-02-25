require 'rails_helper'

RSpec.describe FiltersController, :type => :controller do

	describe 'POST #create' do

		before(:each) do
			@user = create(:user)
			session[:user_id] = @user.id
			@filter = create(:filter)
		end 

		# it 'requires authentication' do 
		# 	post :create
  #     expect(@user.filters.count).to eq(1)
		# end


		it "saves the new contact in the database" do
      expect{
        post :create, filter: attributes_for(:filter)
      }.to change(@user.filters, :count).by(1)
		end

	end

end
