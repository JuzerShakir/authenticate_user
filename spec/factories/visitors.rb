FactoryBot.define do
  factory :visitor do
    sequence(:email) { |n| "test#{n}@authenticate.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end