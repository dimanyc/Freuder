FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "foo#{n}@bar.com" }
    sequence(:uid) { |n| "12312#{n}" }
    provider 'twitter'
    sequence(:image_url) { |n| "https://pbs.twimg.com/profile_images/558793827993911297/Fo7GFEY#{n}_bigger.jpeg" }

  end

end


