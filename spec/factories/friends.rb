FactoryBot.define do
  # factory :friend do
  #   first_name {"john"}
  #   last_name {"dang"}
  #   email {"johnny@example.com"}
  # end

  factory :friend do
    first_name {Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.safe_email }
  end
end
