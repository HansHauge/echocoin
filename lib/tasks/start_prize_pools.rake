namespace :start_prize_pools do
  desc "Starts the prize pool payout cycle"
  task all: :environment do
    PayHourlyPrizeJob.perform_now
  end
end
