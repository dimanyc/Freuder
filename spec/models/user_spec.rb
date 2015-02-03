require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  # it 'cannot_have duplicate uid' do 
  #   expect(build(:dup_user)).to_not be_valid
  # end

  # it 'cannot_have duplicate username' do 
  #   expect(build(:dup_user)).to_not be_valid
  # end

end
