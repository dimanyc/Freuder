require 'rails_helper'

RSpec.describe FiltersController, :type => :controller do

	describe 'POST #create' do

    before(:each) do 
      @user = create(:user, id: 1)
    end

      context 'with valid attributes' do 
      
        it "creates new Filter" do
          expect{
          post :create, user_id: 1, filter: attributes_for(:filter)
          }.to change(Filter, :count).by(1)
        end

        it "redirects_to user_path" do 
          post :create, user_id: 1, filter: attributes_for(:filter)
          expect(response).to redirect_to user_path(@user)
        end

      end

      context 'without valid attributes' do 

        it "doesn't save a Filter with empty 'name' to db " do
          expect {
            post :create, user_id: 1, filter: attributes_for(:filter_with_empty_name)
          }.to_not change(Filter, :count)
        end

        it "doesn't save a Filter with empty 'slips' to db " do
          expect {
            post :create, user_id: 1, filter: attributes_for(:filter_with_empty_slips)
          }.to_not change(Filter, :count)
        end

        it "re-renders the user#show view" do
          post :create, user_id: 1, filter: attributes_for(:filter_with_empty_name)
          expect(response).to render_template :new
        end

      end

	end

  describe "DELETE #destroy" do
    
    before (:each) do 
      @filter = create(:filter)
    end

    it 'deletes the filter' do 
      expect {
        delete :destroy, user_id: 1, filter: attributes_for(:filter)
      }.to change(Filter, :count).by(-1)
    end
    
  end

end
