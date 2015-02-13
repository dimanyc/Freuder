require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'GET #show' do

  before(:each) do 
    user = create(:user, id: 1, username: "user2")  
    get :show, id: user 
  end

    it 'assigns the requested id to @user' do
      expect(assigns(:user)).to eq user
    end

    it 'renders the :show template' do 
      expect(response).to render_template :show 
    end

   
  end

end

  