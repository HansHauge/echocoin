class User < ActiveRecord::Base
  before_create :generate_address
  after_create :generate_name
  validates :name, uniqueness: true

  def get_balance
    BtcBalance.new(btc_address).amount
  end

  private

  def generate_address
    self.btc_address = BtcAddress.create
  end

  def generate_name
    update_attributes!(name: "#{SecureRandom.hex(16)}#{id}")
  end
end
