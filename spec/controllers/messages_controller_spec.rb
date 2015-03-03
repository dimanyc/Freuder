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
  
end
