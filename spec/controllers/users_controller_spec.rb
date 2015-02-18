require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'GET #show' do

    context 'when authenticated' do 

      # add authenticate_

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

      it "loads user profile image" do
        expect(@user.image_url).to_not eq nil 
      end

      context "loads User's messages"

        before(:each) do 
          @messages = @user.messages
          @new_user_message = create(:message, owner: @user)
        end

        it 'and creates @messages instance variable' do 
          expect(@messages).to_not eq nil
        end

        it "and puts each new message in @messages" do 

            expect(@messages).to include @new_user_message
            puts @new_user_message.owner_id  

        end

        it "creates new @message" do 

        end

      

    end

    context 'when not authenticated' do 



    end


  end

end

  