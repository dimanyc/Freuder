require 'rails_helper'

RSpec.describe User, :type => :model do

  ### Factory:
  it "has a valid factory" do 
    expect(build(:user)).to be_valid
  end

  ### Validations: 
  #### Presence:
  it "is valid with UID and username" do 
    expect(build(:user)).to be_valid
  end

  it "is invalid without UID from Twitter" do 
    user = build(:user, uid: nil)
    user.valid?
    expect(user.errors[:uid]).to include("can't be blank")
  end
 
  it "is invalid without username" do 
    user = build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  #### Uniqueness:
  it "is invalid with a duplicate UID" do 
    create(:user, uid:12233)
    user = build(:user, uid: 12233)
    user.valid?
    expect(user.errors[:uid]).to include("has already been taken")
  end

  it "is invalid with a duplicate username" do 
    create(:user, username: "Foobarrito")
    user = build(:user, username: "Foobarrito")
    user.valid?
    expect(user.errors[:username]).to include("has already been taken")
  end

  ### Associations:
  context 'can have' do
    
    before(:each) do 
      @user = build(:user)
      @message = build(:message)
      @filter = build(:filter)
    end

    it 'many messages' do 
      @user.messages << @message 
      expect(@user.messages.first).to be @message
    end

    it 'many filters' do 
      @user.filters << @filter
      expect(@user.filters.first).to be @filter
    end

  end
end
