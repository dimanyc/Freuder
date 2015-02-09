require 'rails_helper'

RSpec.describe User, :type => :model do


  it "is invalid without UID from Twitter" do 
    user = User.new(
      username: "foo",
      uid: nil
    )
    expect(user).to_not be_valid
  end
 
  # ### Factory Validation
  # it 'has a valid factory' do
  #   expect(build(:user)).to be_valid
  # end

  # ### 'UID' Validation
  # context 'when UID already exists' do 

  #   let (:user) { User.new(uid:123123) }
  
  #   it 'should not be valid' do
  #     expect(user.valid?).to be_falsey 
  #   end

  #   it 'should not save' do 
  #     expect(user.save).to be_falsey 
  #   end

  # end

  # ### 'Username' Validation
  # context 'when username already exists' do 
    
  #   let (:user) { User.new(username:"DimaNYC") }

  #   it 'should not be valid' do
  #     expect(user.valid?).to be_falsey 
  #   end

  #   it 'should not save' do 
  #     expect(user.save).to be_falsey 
  #   end

  # end
 
end
