class BookRankingSerializer < Panko::Serializer
  attributes :id, :author, :title, :image, :editor, :year,
             :genre, :times_rented, :created_at, :updated_at
end
