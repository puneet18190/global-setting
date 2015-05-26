FactoryGirl.define do
  factory :setting do
    name { Faker::Name.name }
    setting_type { Faker::Name.name}
    value { Faker::Name.name}

  end
  
end