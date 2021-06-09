class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :genre, :author, :image, :title, :editor, :year, presence: true
end
