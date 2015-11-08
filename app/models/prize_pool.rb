class PrizePool < ActiveRecord::Base
  before_create :generate_address

  def total
    last_date = Time.now
    first_date = last_date - time_since_last_payout
    time_range = first_date..last_date

    entries = Entry.where(created_at: time_range)

    entries.inject(0) do |total, entry|
      total += entry.total * 0.00125
    end
  end

  def my_age
    (Time.now - created_at).to_i
  end

  def time_since_last_payout
    my_age % payout_frequency
  end

  private

  def generate_address
    self.btc_address = BtcAddress.create_with_no_coins("Pool: #{self.name}")
  end
end
