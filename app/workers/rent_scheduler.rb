require 'sidekiq-scheduler'

class RentScheduler
  include Sidekiq::Worker

  def perform
    Rent.are_due(DateTime.current.to_date).find_each do |rent|
      ::RentMailer.rent_due(rent.id).deliver_later
    end
  end
end
