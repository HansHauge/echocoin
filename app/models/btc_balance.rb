class BtcBalance
  attr_reader :btc_address

  def initialize(btc_address)
    @btc_address = btc_address
    @bc = BtcRemote.connect
  end

  def amount
    accounts = @bc.listreceivedbyaddress(0, true)
    my_account = {}

    accounts.each do |account|
      if account["address"] == btc_address
        my_account = account
      end
    end

    my_account["amount"].to_f
  end
end
