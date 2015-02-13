require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'GET #show' do

  before(:each) do 
    
  end

    it 'assigns the requested id to @user' do
      user = create(:user)
      get :show, id: user 
      expect(assigns(:user)).to eq user
      
    end

    it 'renders the :show template' do 
      user = create(:user)
    get :show, id: user 
      expect(response).to render_template :show 
    end

   
  end

end

  