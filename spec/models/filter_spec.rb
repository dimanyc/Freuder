require 'rails_helper'

RSpec.describe Filter, :type => :model do

  ### Factory:
  it 'has a valid factory' do 
    expect(build(:filter)).to be_valid
  end

  ### Validations:
  it 'is invalid without a Name' do 
    filter = build(:filter, name: nil)
    filter.valid?
    expect(filter.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without Slips' do 
    filter = build(:filter, slips: nil)
    filter.valid?
    expect(filter.errors[:slips]).to include("can't be blank")
  end

  #### ".split_to_array method works:
  it 'is able to change Slips object to Array data type' do 
    filter = build(:filter)
    expect(filter.split_to_array(filter.slips)).to be_an_instance_of(Array)
  end


  ### Associations:
  context 'is associated with other Classes and' do 

    before(:each) do 
      @filter = build(:filter)
      @user = build(:user)
      @message = build(:message)
    end

    it 'belongs to a User' do   
      @user.filters << @filter
      expect(@user.filters.last).to be @filter
    end

    it 'can have many Messages' do 
      @filter.messages << @message
      expect(@filter.messages.last). to be @message
    end

  end
  
end
