FactoryBot.define do
  factory :rent do
    user { build(:user) }
    book { build(:book) }
    start_date { Faker::Date.backward(days: 1) }
    end_date { Faker::Date.forward(days: 30) }
  end
end
