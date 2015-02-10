require 'rails_helper'

RSpec.describe Message, :type => :model do
  
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
