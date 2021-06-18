class RentMailer < ApplicationMailer
  default from: 'rents@wolox.co'
  def new_rent(rent_id)
    @rent = Rent.find(rent_id)
    @user = @rent.user
    @book = @rent.book

    I18n.with_locale(@user.locale) do
      mail(to: @user.email, subject: I18n.t(:new_rent))
    end
  end

  def rent_due(rent_id)
    @rent = Rent.find(rent_id)
    @user = @rent.user
    @book = @rent.book

    I18n.with_locale(@user.locale) do
      mail(to: @user.email, subject: I18n.t(:rent_due))
    end
  end
end
