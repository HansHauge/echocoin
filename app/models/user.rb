
class User < ActiveRecord::Base
  after_create :initialize_balance
  after_create :generate_name
  after_create :generate_address

  validates :name, uniqueness: true

  def get_balance
    balance
  end

  def transfer_bitcoins(recipient, total, charity_id)
    update_attributes!(balance: (self.balance - (total * 1.016)))
    them = User.where(btc_address: recipient).first
    them.update_attributes(balance: (them.balance + total))
    # binding.pry
    the_charity = Charity.find(charity_id)
    the_charity.update_attributes!(balance: (the_charity.balance.to_f + (total * 0.005)))
    the_charity.update_attributes!(lifetime_contributions: (the_charity.balance.to_f + (total * 0.005)))
  end

  private

  def initialize_balance
    update_attributes(balance: 5.0)
  end

  def generate_address
    update_attributes!(btc_address: BtcAddress.create_with_no_coins("User: #{name}"))
  end

  def generate_name
    update_attributes!(name: "#{SecureRandom.hex(16)}#{id}")
  end
end
