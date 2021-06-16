class RentMailer < ActionMailer::Base
  default from: 'rents@wolox.co'
  def new_rent(rent_id)
    @rent = Rent.find(rent_id)
    @user = @rent.user
    @book = @rent.book

    mail(to: @user.email, subject: 'New rent')
  end
end