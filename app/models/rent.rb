class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :start_date, :end_date, presence: true

  after_create :increase_times_rented

  scope :are_active, lambda { |today|
                       where("start_date < '#{today}' AND end_date > '#{today}' AND returned = false")
                     }

  private

  def increase_times_rented
    book = Book.find(book_id)
    book.times_rented += 1
    book.save
  end
end
