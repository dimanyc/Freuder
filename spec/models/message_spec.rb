require 'rails_helper'

RSpec.describe Message, :type => :model do
  
  context 'standard Tweet' do 
  
  before(:each) do 
    @message = build(:message)
  end

  ### Columns to Array initiation
    it 'has Array data types in Slipped, Hashtags and Mentions' do 
      expect(@message.slipped).to eq([])
      expect(@message.hashtags).to eq([])
      expect(@message.mentions).to eq([])
    end

  ### Factory
    it 'has a valid factory' do
      expect(@message).to be_valid
    end

    it 'accepts array appending to Slipped, Hashtags and Mentions' do 
      expect(@message.slipped << "foobarrito").to eq(["foobarrito"])
    end
  end
  ### Validations:

  #### Presence:
  it 'is not valid without a body' do
    pending
  end

  it 'is not valid without an author' do 
    pending
  end


  #### Body length:
  it 'is not valid with body length of < 3 characters' do 
    pending
  end

  it 'is not valid with body length of > 140 characters' do 
    pending
  end

  #### Uniquness: 
  it 'is not valid with a duplicate body' do
    pending
  end

end
