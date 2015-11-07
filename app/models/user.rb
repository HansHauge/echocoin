class User < ActiveRecord::Base
  require 'rubygems'
  require 'rpcjson'

  after_create :generate_name
  validates :name, uniqueness: true

  def get_balance
    @bc ||= RPC::JSON::Client.new "http://warrenv:warrenvPASS@45.79.175.63:18332", 1.1
    accounts = @bc.listreceivedbyaddress(0, true)
    my_account = {}
    my_balance = 0.0

    accounts.each do |account|
      if account["address"] == btc_address
        my_account = account
      end
    end

    if my_account.present?
      my_balance = my_account["amount"].to_f
    else
      update_attributes!(btc_address: @bc.getnewaddress)
      @bc.sendtoaddress(btc_address, 5.0)
      @bc.generate(1)
      my_balance = 5.0
    end

    my_balance
  end

  private

  def generate_name
    update_attributes!(name: "#{SecureRandom.hex(16)}#{id}")
  end
end
