class Charity < ActiveRecord::Base
  before_create :generate_address
  after_create :set_initial_funds

  # def get_balance
  #   BtcBalance.new(btc_address).amount
  # end

  private

  def set_initial_funds
    update_attributes!(balance: 0.00)
    update_attributes!(lifetime_contributions: 0.00)
  end

  def generate_address
    self.btc_address = BtcAddress.create_with_no_coins("Charity: #{self.name}")
  end
end
