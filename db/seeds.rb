# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1000.times do
  Book.create(
    genre: Faker::Book.genre,
    author: Faker::Book.author,
    image: Faker::Internet.url(host: 'wolox.com.ar', path: '/image.jpg'),
    title: Faker::Book.title.truncate(25),
    editor: Faker::Book.publisher,
    year: Faker::Number.between(from: 1000, to: 2019),
    times_rented: Faker::Number.between(from: 1, to: 20)
  )
end
