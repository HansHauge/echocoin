class PrizePool < ActiveRecord::Base

  def total
    last_date = Time.now
    first_date = last_date - time_since_last_payout
    time_range = first_date..last_date

    entries = Entry.where(created_at: time_range)
    total = 0.00

    entries.each do |entry|
      total += entry.total.to_i * 0.01
    end

    total
  end

  def my_age
    (Time.now - created_at).to_i
  end

  def time_since_last_payout
    my_age % payout_frequency
  end
end
