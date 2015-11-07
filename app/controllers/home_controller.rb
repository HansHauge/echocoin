class HomeController < ApplicationController
  before_action :get_user
  def show

  end

  private

  def get_user
    @user = User.new(name: "test user")
  end
end
