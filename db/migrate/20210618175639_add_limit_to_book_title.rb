class AddLimitToBookTitle < ActiveRecord::Migration[6.1]
  def up
    truncate_books_title
    change_column :books, :title, :string, :limit => 25
  end

  def down
    change_column :books, :title, :string, :limit => nil
  end

  def truncate_books_title
    Book.find_each do |book|
      book.title = book.title.truncate(25)
      book.save!
    end
  end

end
