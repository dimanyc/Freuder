Given(/^I am a new user$/) do
  @user = User.new 
end

When(/^I got to the home page$/) do
  visit home_path
end

When(/^I click on "(.*?)" button$/) do |arg1|
  click_link 'Sign in with Twitter'
end

Then(/^I'm redirected to my profile page$/) do
  visit user_path(:id=>123)
end