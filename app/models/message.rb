class Message < ActiveRecord::Base

  # Set columns to Array data type: 
  serialize :slipped, Array
  serialize :hashtags, Array
  serialize :mentions, Array

  # Validations:
  validates :body, presence: true, uniqueness: true, length: { within: 3...143, too_long: "body is too long", too_short: "body is too short" }
  validates :author, presence: true, uniqueness: true

end
