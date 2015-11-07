class HomeController < ApplicationController
  before_action :get_user, :get_prize_pools, :get_charities, :get_users, :get_entry, only: :show

  def show
  end

  private

  def get_entry
    @entry = Entry.new
  end

  def get_prize_pools
    @bi_weekly = PrizePool.find_by_name('Bi-weekly')
    @weekly = PrizePool.find_by_name('Weekly')
    @daily = PrizePool.find_by_name('Daily')
    @hourly = PrizePool.find_by_name('Hourly')
  end

  def get_charities
    @charities = Charity.all
  end

  def get_users
    @users = User.all.limit(10)
  end

  def get_user
    @user = User.find_by_name session[:name]
    unless @user
      @user = User.create
      session[:name] = @user.name
    end
  end
end
