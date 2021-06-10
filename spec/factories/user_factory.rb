require 'faker'

FactoryBot.define do
  factory :user do
    alphanumeric_password = Faker::Alphanumeric.alphanumeric(number: 10)
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { alphanumeric_password }
    password_confirmation { alphanumeric_password }
    email { Faker::Internet.email }
  end
end
