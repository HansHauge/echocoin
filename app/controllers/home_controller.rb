class HomeController < ApplicationController
  before_action :get_user

  def show
  end

  private

  def get_user
    if session[:name]
      @user = User.find_by_name session[:name]
    else
      @user = User.create
      session[:name] = @user.name
    end
  end
end
