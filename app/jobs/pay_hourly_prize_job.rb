class PayHourlyPrizeJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    my_prize_pool = PrizePool.find_by_name('Hourly')
    total_to_pay = my_prize_pool.total
    prize_pool_entries = my_prize_pool.get_the_entries

    if prize_pool_entries.blank?
      puts "Could not find any entries to pay for the hourly prize..."
    else
      winning_entry = prize_pool_entries.sample
      winning_user = User.where(btc_address: winning_entry.sender).first
      winning_user.update_attributes!(balance: (winning_user.balance + total_to_pay))
      puts "Congratulations to #{winning_entry.sender} who just won #{total_to_pay} BTC!"
    end
  end
end
