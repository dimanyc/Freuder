require 'rails_helper'

RSpec.describe MessagesController, :type => :controller do

  describe 'PATCH #update_messages' do
    
    before(:each) do 
      #@messages = create_list(:message, 20)
    end

      it 'creates Messages' do
        expect{
          post :update, create_list(:message, 20)
          }.to change(Message, :count).by(20)
      end

  end 

    # before (:each) do 
    #   @filter = create(:filter, id: 1)
    #   @user = create(:user, id: 1)
    # end

    # it 'deletes the filter' do 
    #   expect {
    #     delete :destroy, user_id: 1, id: 1
    #   }.to change(Filter, :count).by(-1)
    # end  

end
