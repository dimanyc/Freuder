require 'rails_helper'

RSpec.describe User, :type => :model do

  ### Presence:
  it "is valid with UID and username" do 
    user = User.new(
      username: "foo",
      uid: 123123123
    )
    expect(user).to be_valid
  end

  it "is invalid without UID from Twitter" do 
    user = User.new(
      username: "bar",
      uid: nil
    ) 
    user.valid?
    expect(user.errors[:uid]).to include("can't be blank")
  end
 

  it "is invalid without username" do 
    user = User.new(
      username: nil,
      uid: 54876453
    ) 
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  ### Duplication:
  it "is invalid with a duplicate uid" do 
    User.create(
      username: "Foo",
      uid:"23423423"
      )
    user = User.create(
      username: "Bar",
      uid:"23423423"
      )
    user.valid?
    expect(user.errors[:uid]).to include("has already been taken")
  end

  it "is invalid with a duplicate username" do 
    User.create(
      username: "Foo",
      uid:"21231423"
      )
    user = User.create(
      username: "Foo",
      uid:"23423423"
      )
    user.valid?
    expect(user.errors[:username]).to include("has already been taken")
  end  
end
