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

  #### "Slips" to Array initiation:
  it 'accepts new Slips as Array' do 
    filter = build(:filter)
    new_slips = ["foo","bar","baz"]
    filter.slips << new_slips
    expect(filter.slips).to include new_slips
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
