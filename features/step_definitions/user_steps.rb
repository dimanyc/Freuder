Given(/^I am a new user$/) do
  
end

When(/^I got to the home page$/) do
  visit home_path
end

When(/^I click on "(.*?)" button$/) do |arg1|
  click_link 'Sign in with Twitter'
end

Then(/^I am able to authenticate myself as a valid user$/) do
  pending # express the regexp above with the code you wish you had
end