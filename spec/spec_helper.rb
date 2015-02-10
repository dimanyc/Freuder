
require 'capybara/rspec'

### OAuth Test helper:
require 'helpers/omni_auth_test_helper'

RSpec.configure do |config|

  #### Initiating OAuth auth mocking helper methods: 
  config.include OmniAuthTestHelper

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  ### Show verbose output for each test
  config.formatter = :documentation
end

