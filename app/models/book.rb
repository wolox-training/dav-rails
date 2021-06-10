class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :editor, :year, presence: true

  Reducer = Rack::Reducer.new(
    all,
    ->(author:) { where('lower(author) like ?', "%#{author.downcase}%") },
    ->(genre:) {  where('lower(genre) like ?', "%#{genre.downcase}%") },
    ->(title:) {  where('lower(title) like ?', "%#{title.downcase}%") }
  )
end
