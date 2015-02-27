FactoryGirl.define do
  factory :filter do
    sequence(:user_id) { |id| id } 
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    sequence(:slips) { |number| "random#{number}, set#{number}, of#{number}, slips#{number}" }
    case_sensitive false
    keep_slips_order false
  end

  factory :invalid_filter, parent: :filter do
    name nil
    slips nil
  end

  # factory :user do 
  #   sequence(:username) { |sequenced_number| "user#{sequenced_number}" }
  #   sequence(:email) { |sequenced_number| "foo#{sequenced_number}@bar.com" }
  #   sequence(:uid) { |sequenced_number| "12312#{sequenced_number}" }
  #   provider 'twitter'
  #   sequence(:image_url) { |sequenced_number| "https://pbs.twimg.com/profile_images/558793827993911297/Fo7GFEY#{sequenced_number}_bigger.jpeg" }
  # end

  # factory :invalid_user, parent: :user do
  #   username nil
  #   uid nil
  # end

end

