FactoryBot.define do
  factory(:user) do
    sequence(:email) { Faker::Internet.safe_email }
    password { 'khoa123' }
  end
end
