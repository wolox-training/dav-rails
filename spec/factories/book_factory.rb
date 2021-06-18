require 'faker'

FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::Internet.url(host: 'wolox.com.ar', path: '/image.jpg') }
    title { Faker::Book.title.truncate(25) }
    editor { Faker::Book.publisher }
    year { Faker::Number.between(from: 1000, to: 2019) }
    times_rented { Faker::Number.between(from: 1, to: 20) }
  end
end
