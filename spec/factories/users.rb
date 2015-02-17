FactoryGirl.define do
  factory :user do
    sequence(:username) { |sequenced_number| "user#{sequenced_number}" }
    sequence(:email) { |sequenced_number| "foo#{sequenced_number}@bar.com" }
    sequence(:uid) { |sequenced_number| "12312#{sequenced_number}" }
    provider 'twitter'
    sequence(:image_url) { |sequenced_number| "https://pbs.twimg.com/profile_images/558793827993911297/Fo7GFEY#{sequenced_number}_bigger.jpeg" }

  end

  factory :invalid_user do 
    uid nil
  end

end


