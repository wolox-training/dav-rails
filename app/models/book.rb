class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :genre, :author, :image, :title, :editor, :year, presence: true
  has_many :rents, dependent: :destroy

  Reducer = Rack::Reducer.new(
    all,
    ->(author:) { where('lower(author) like ?', "%#{author.downcase}%") },
    ->(genre:) {  where('lower(genre) like ?', "%#{genre.downcase}%") },
    ->(title:) {  where('lower(title) like ?', "%#{title.downcase}%") }
  )
end
