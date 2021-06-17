require 'sidekiq-scheduler'

class RentDue
  include Sidekiq::Worker

  def perform
    RentMailer.rent_due.deliver_later
  end
end