require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'GET #show' do

    it "has a 200 status code" do
      get :show
      expect(response.status).to eq(200)
    end

    before(:each) do 
      allow(controller).to receive(:current_user) { user } 
    end

    it "assigns the requested user to @user" do
      expect(assigns(:user)).to eq user
    end

    it "renders the :show template" do
      user = create(:user)
      get :show, id: user
      expect(response).to render_template :show
    end

  end

end

  