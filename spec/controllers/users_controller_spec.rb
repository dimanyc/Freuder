require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'GET #show' do
    before(:each) do
      @user = create(:user)
    end


    it 'requires authentication' do 
      get :show, id: @user.id
      expect(response).to require_login
    end

    context 'when authenticated' do 

      before(:each) do 
        session[:user_id] = @user.id
        get :show, id: @user.id
      end

      it "renders the :show template" do
        expect(response).to render_template :show
      end

      it "assigns the requested user to @user" do
        expect(assigns(:user)).to eq @user
      end

      it "loads user profile image" do
        expect(@user.image_url).to_not eq nil 
      end

      context "loads User's messages" do 

        before(:each) do
          #subject { @user }
          @message = create(:message, body:"testing whether user.messages << message works")
          @user.messages << @message
          #@message = create(:message, user: @user)
          #@user = create(:user, :messages => create(:message))
          #@message = create(:message)
        end

        it 'and saves each new message to user.messages' do 
          expect(@user.messages).to include @message
        end

        # it 'and creates @messages instance variable' do 
        #   expect(@messages).to_not eq nil
        # end

        # it "and creates new @message as User's message" do 
        #   expect(@user.messages).to include @messages
        # end

      end

      context "loads User's filters" do 

        before(:each) do 
          @filters = @user.filters
          @filter = create(:filter, user: @user) 
        end

        it 'and creates @filters instance variable' do 
          expect(@filters).to_not eq nil
        end

        it 'and puts each new filters in @filters' do 
          expect(@filters).to include @filter
        end

        it "and creates new @filter as User's filter" do 
          expect(@filter.user_id).to eq @user.id
        end

      end
      
    end

  end

end

  