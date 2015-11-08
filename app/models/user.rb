
class User < ActiveRecord::Base
  before_create :initialize_balance
  after_create  :generate_name
  after_create  :generate_address

  validates :name, uniqueness: true

  def get_balance
    balance
  end

  private

  def initialize_balance
    self.balance = 5.0
  end

  def generate_address
    self.btc_address = BtcAddress.create_with_no_coins("User: #{self.name}")
  end

  def generate_name
    update_attributes!(name: "#{SecureRandom.hex(16)}#{id}")
  end
end
