require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do

  it 'creates current_user helper' do
    user = create(:user)
    expect(assigns(:user)).to eq @current_user
  end

end
