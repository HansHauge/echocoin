class HomeController < ApplicationController
  before_action :get_user, :get_prize_pools

  def show
  end

  private

  def get_prize_pools
    @bi_weekly = PrizePool.find_by_name('Bi-weekly')
    @weekly = PrizePool.find_by_name('Weekly')
    @daily = PrizePool.find_by_name('Daily')
    @hourly = PrizePool.find_by_name('Hourly')
  end

  def get_user
    if session[:name]
      @user = User.find_by_name session[:name]
    else
      @user = User.create
      session[:name] = @user.name
    end
  end
end
