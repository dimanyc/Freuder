require 'rails_helper'

RSpec.describe FiltersController, :type => :controller do

	describe 'GET #index' do

		before(:each) do
			@user = create(:user)
			@filter = create(:filter)
		end 

		it 'requires authentication' do 
			get :index, id: @user.id
      expect(response).to require_login
		end

		it 'sees current user filters' do 

			# expect(create(:filter)).to not be_nil

		end 

	end

end
