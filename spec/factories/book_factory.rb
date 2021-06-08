require 'faker'

FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::Internet.url(host: 'wolox.com.ar', path: '/image.jpg') }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    year { Faker::Number.between(from: 1000, to: 2019) }
  end
end
