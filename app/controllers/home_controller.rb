class HomeController < ApplicationController
  before_action :get_prize_pools, :get_charities, :get_users, :get_entry, :get_entries, only: :show
  before_action :get_user

  def terms
  end

  def about
  end

  def show
  end

  def create
    get_user
    @entry = Entry.new(entry_params)

    binding.pry

    if (@user.balance > (@entry.total.to_i * 1.016)) && @entry.save
      @user.transfer_bitcoins(@entry.recipient, @entry.total, @entry.charity_id)

      session[:new_transfer] = true
      redirect_to '/'
    else
      get_prize_pools
      get_charities
      get_users
      get_entries

      render :show
    end
  end

  private

  def get_entries
    @entries = Entry.where(status: 'won').order('created_at DESC').limit(5)
  end

  def get_entry
    @entry = Entry.new
  end

  def get_prize_pools
    @prize_pools = PrizePool.all
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
      @new_user = true
    else
      @new_user = false
    end
  end

  def entry_params
    params.require(:entry).permit(:recipient, :total, :terms, :charity_id, :sender)
  end
end
