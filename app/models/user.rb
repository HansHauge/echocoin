class User < ActiveRecord::Base
  after_create :generate_name
#  after_create :generate_address
  before_create :initialize_balance

  validates :name, uniqueness: true

  def get_balance
    #BtcBalance.new(btc_address).amount
    balance
  end

  private

  def initialize_balance
    self.balance = 5.0
  end

#  def generate_address
#    self.btc_address = BtcAddress.create_with_coins("User: #{self.name}")
#  end

  def generate_name
    update_attributes!(name: "#{SecureRandom.hex(16)}#{id}")
  end
end
