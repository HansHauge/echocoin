require "rails_helper"

RSpec.describe BtcBalance, :type => :model do
  describe '#amount' do
    it "finds my account and returns my balance" do
      btc_address = BtcAddress::create_with_coins('An account nickname')
      btc_balance = BtcBalance.new(btc_address)
      expect(btc_balance.amount).to be_a(Float)
    end
  end
end
