require 'faker'

FactoryBot.define do
  factory :book_suggestion do
    synopsis { Faker::Lorem.paragraph }
    price { Faker::Commerce.price }
    author { Faker::Book.author }
    link { Faker::Internet.url(host: 'wolox.com.ar', path: '/image.jpg') }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    year { Faker::Number.between(from: 1000, to: 2021) }
    user { build(:user) }
  end
end
