FactoryBot.define do
  factory :invalid do
    first_name nil
  end

  factory :friend do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.safe_email }
    phone { Faker::PhoneNumber.cell_phone }
    twitter { Faker::Quote }
    user
  end
end
