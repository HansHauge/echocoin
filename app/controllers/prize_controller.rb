class PrizeController < ApplicationController

  def jackpot
    if params[:time_frame] == 'Hourly'
      PayHourlyPrizeJob.perform_now
    elsif params[:time_frame] == 'Daily'
      PayDailyPrizeJob.perform_now
    elsif params[:time_frame] == 'Weekly'
      PayWeeklyPrizeJob.perform_now
    elsif params[:time_frame] == 'Bi-weekly'
      PayBiWeeklyPrizeJob.perform_now
    end

    render json: params

  end
end
