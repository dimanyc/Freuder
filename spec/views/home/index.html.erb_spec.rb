require 'spec_helper'

describe 'home/index.html.erb' do 
  
  it "has homepageintro id element" do 
    render
    expect(rendered).to have_selector('section#homepageintro')
  end

  it "has a Sign-in via Twitter link " do
    render 
    expect(rendered).to have_link('Sign in with Twitter')
  end

end

