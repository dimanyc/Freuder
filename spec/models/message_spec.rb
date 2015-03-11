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

    #### Columns to Array initiation
    it 'has Array data types in Slipped, Hashtags and Mentions columns' do 
      message = build(:message)
      expect(message.slipped).to eq([])
      expect(message.hashtags).to eq([])
      expect(message.mentions).to eq([])
    end

  ### Associations:
  context 'has a many-to-many association and can' do 

    before(:each) do 
      @message = build(:message)
      @filter = build(:filter)
      @user = build(:user)
    end

    it 'belong to a Filter' do 
      @filter.messages << @message
      expect(@filter.messages.first).to be @message
    end

    it 'belong to a User' do 
      @user.messages << @message
      expect(@user.messages.first).to be @message    
    end
  end

  ### Tweet: 
  context 'as a Tweet' do 
  
    before(:each) do 
      @message = build(:message)
    end

    it 'accepts array data appending in Slipped, Hashtags and Mentions columns / objects' do 
      expect(@message.slipped << "foobarrito").to eq(["foobarrito"])
      expect(@message.hashtags << "#foobarrito").to eq(["#foobarrito"])
      expect(@message.mentions << "@foobarrito").to eq(["@foobarrito"])
    end

    #### Body length:
    it 'is not valid with body length of < 3 or > 200 characters' do
      message1 = build(:message, body: "fo")
      message2 = build(:message, body: "#{@message.body}" + "somemorestupidcharactersthatwillincreasethecharactercountbygodknowshowmuchandattheendwillmakethistestpasspassisaidnotfail") 
      message1.valid?
      expect(message1.errors[:body]).to include ("body is too short")
      message2.valid?
      expect(message2.errors[:body]).to include ("body is too long")
    end

  end

  ### Pull & Analyze
  context 'can be' do 
    
    before(:example) do 
      @user = create(:user, id: 998)
    end

    it 'pulled from Twitter via API' do 
      Message.pull_tweets(@user)
      expect(Message.ids.count).to_not eq(0)
    end

    before(:example) do 
      @user = create(:user, id: 999, oauth_token: "2981523107-fwusJLpEUQXuxcKU9NKKFJ7iqVzPRCPlE8dYrhm", oauth_secret: "jqkqsT2uc1pGwML8XduGNBmYboVWsdEoDkgBvAMPlGl1v")
      @filter = @user.filters.create(name: "foobarrito", slips: "to") #at least one out of 20 tweets will have the word "to" in it. 
    end

    it 'saved if it matches one of the Filters' do
      Message.pull_tweets(@user)
      @filter.analyze_tweets(@user)
      expect(@filter.messages.count).to_not eq(0)
    end

    it 'will not save the same Tweet twice for the same Filter' do
      @message = @filter.messages.create(body: "I am a duplicate message body", author:"foobarrito")
      @user.messages.create(body: "I am a duplicate message body", author:"foobarrito")
      @filter.analyze_tweets(@user)
      expect(@filter.messages.where(body:"I am a duplicate message body").count).to eq(1)
    end

  end
  

end
