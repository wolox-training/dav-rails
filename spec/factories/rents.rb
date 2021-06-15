FactoryBot.define do
  factory :rent do
    user_id { create(:user).id }
    book_id { create(:book).id }
    start_date { Faker::Date.backward(days: 1) }
    end_date { Faker::Date.forward(days: 30) }
  end
end
