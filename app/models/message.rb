class Message < ActiveRecord::Base

  ### Active Relations:
  belongs_to :owner, polymorphic: true
  belongs_to :processor, polymorphic: true

  ### Validations:
  validates :body, presence: true, uniqueness: true, length: { within: 3...143, too_long: "body is too long", too_short: "body is too short" }
  validates :author, presence: true, uniqueness: true

end
