module Api
  class BlockExplorerController < ApplicationController

    def check_balance
      @block_explorer_api = BlockExplorerApi.new(params[:btc_address])
      balance = @block_explorer_api.check_balance
      render json: { params[:btc_address] => "#{balance} BTC" }
    end
  end
end
