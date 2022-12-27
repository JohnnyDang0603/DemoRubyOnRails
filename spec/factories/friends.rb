FactoryBot.define do
  factory :invalid_friend do
    first_name nil
  end

  factory :friend do
    user
    phone { Faker::PhoneNumber.cell_phone }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.safe_email }
  end
end
