class Charity < ActiveRecord::Base
  before_create :generate_address

  def get_balance
    BtcBalance.new(btc_address).amount
  end

private

  def generate_address
    self.btc_address = BtcAddress.create_with_no_coins
  end
end
