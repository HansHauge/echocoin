namespace :start_prize_pools do
  desc "Starts the prize pool payout cycle"
  task all: :environment do
    # PayHourlyPrizeJob.perform_now
    # PayDailyPrizeJob.perform_now

    # PayHourlyPrizeJob.set(wait: 1.hour).perform_later
    # PayDailyPrizeJob.set(wait: 1.day).perform_later
  end
end
