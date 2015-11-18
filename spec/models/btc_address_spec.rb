require "rails_helper"

RSpec.describe BtcAddress, :type => :model do
  describe '#self.create_with_no_coins' do
    it "responds with a new btc_address" do
      btc_address = BtcAddress::create_with_no_coins('An account nickname')
      expect(btc_address).to be_a(String)
      expect(btc_address.length > 30).to be_truthy
    end
  end

  describe '#self.create_with_coins' do
    it "responds with a new btc_address" do
      btc_address = BtcAddress::create_with_coins('An account nickname')
      expect(btc_address).to be_a(String)
      expect(btc_address.length > 30).to be_truthy
    end
  end
end
