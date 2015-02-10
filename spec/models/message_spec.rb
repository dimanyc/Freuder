require 'rails_helper'

RSpec.describe Message, :type => :model do
  
  ### Factory
  it 'has a valid factory' do
    expect(build(:message)).to be_valid
  end

  ### Validations:

  #### Presence:
  it 'is not valid without a body' do
    message = build(:message, body: nil)
    message.valid?
    expect(message.errors[:body]).to include ("can't be blank")
  end

  it 'is not valid without an author' do 
    message = build(:message, author: nil)
    expect(message).to_not be_valid
  end

  #### Uniquness: 
  it 'is not valid with a duplicate body' do
    create(:message, body: "foobarrito")
    duplicate_message = build(:message, body: "foobarrito")
    duplicate_message.valid?
    expect(duplicate_message.errors[:body]).to include ("has already been taken")
  end

  #### Columns to Array initiation
  it 'has Array data types in Slipped, Hashtags and Mentions columns' do 
    message = build(:message)
    expect(message.slipped).to eq([])
    expect(message.hashtags).to eq([])
    expect(message.mentions).to eq([])
  end

  ### Tweet: 
  context 'Tweet' do 
  
    before(:example) do 
      @message = build(:message)
    end

    it 'accepts array data appending in Slipped, Hashtags and Mentions columns / objects' do 
      expect(@message.slipped << "foobarrito").to eq(["foobarrito"])
    end

    #### Body length:
    it 'is not valid with body length of < 3 or > 143 characters' do
      message1 = build(:message, body: "fo")
      message2 = build(:message, body: "#{@message.body}" + "xyz") 
      message1.valid?
      expect(message1.errors[:body]).to include ("body is too short")
      message2.valid?
      expect(message2.errors[:body]).to include ("body is too long")
    end

  end

end
