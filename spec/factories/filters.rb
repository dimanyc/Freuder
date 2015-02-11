FactoryGirl.define do
  factory :filter do
    sequence(:user_id) { |id| id } 
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    sequence(:slips) { |number| ["random#{number}", "set#{number}", "of#{number}", "slips#{number}"] }
    case_sensitive false
    keep_slips_order false

    trait :filter_without_slips do
      slips "foobar_array"
    end

  end

end

