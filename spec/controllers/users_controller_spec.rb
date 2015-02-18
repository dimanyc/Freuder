require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'GET #show' do

    before(:each) do 
      @user = create(:user)
      get :show, id: @user.id
    end

    it "assigns the requested user to @user" do
      expect(assigns(:user)).to eq @user
    end


    it "renders the :show template" do
      expect(response).to render_template :show
    end

  end

end

  