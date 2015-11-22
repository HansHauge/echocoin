require "rails_helper"

RSpec.describe Charity, :type => :model do
  describe 'creation process' do
    before do
      @charity = Charity.where(name: "Whirled Peas").first_or_create
    end

    it "will be created with a balance of 0 (float)" do
      balance = @charity.balance
      expect(balance).to eq(0)
      expect(balance).to be_a(Float)
    end

    it 'will respond to lifetime_contributions' do
      expect(@charity).to respond_to(:lifetime_contributions)
    end

    it 'will respond to btc_address' do
      expect(@charity).to respond_to(:btc_address)
    end

    it 'will respond to name' do
      expect(@charity).to respond_to(:name)
    end

    it 'actually has the name we gave it' do
      expect(@charity.name).to eq('Whirled Peas')
    end
  end
end
