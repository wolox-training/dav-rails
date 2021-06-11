class RentSerializer < Panko::Serializer
  attributes :id, :start_date, :end_date

  has_one :book, each_serializer: BookSerializer
  has_one :user, each_serializer: UserSerializer
end
