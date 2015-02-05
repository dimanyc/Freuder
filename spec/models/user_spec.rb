require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it 'cannot_have duplicate uid' do 
    expect(User.create(uid:123123)).to_not be_valid
  end

  it 'cannot_have duplicate username' do 
    expect(User.create(username:"DimaNYC")).to_not be_valid
  end  


end
