require "rails_helper"

RSpec.describe User, :type => :model do
  describe '#get_balance' do
    let!(:user){ User.create }

    it 'returns the balance' do
      expect(user.get_balance).to be_a(Float)
    end
  end

  describe '#transfer_bitcoins' do
    let!(:first_user) { User.create }
    let!(:second_user) { User.create }
    let!(:charity) { Charity.create(name: "Visualize Whirled Peas") }

    it 'actually subtracts from the sender' do
      initial_balance = first_user.get_balance
      first_user.transfer_bitcoins(second_user.btc_address, 1.00, charity.id)
      ending_balance = first_user.get_balance
      expect(initial_balance > ending_balance).to be_truthy
    end

    it 'increases the balance of the recipient' do
      initial_balance = second_user.get_balance
      first_user.transfer_bitcoins(second_user.btc_address, 1.00, charity.id)
      second_user.reload
      ending_balance = second_user.get_balance
      expect(initial_balance < ending_balance).to be_truthy
    end

    it 'increases the balance of the charity' do
      initial_balance = charity.balance
      first_user.transfer_bitcoins(second_user.btc_address, 1.00, charity.id)
      charity.reload
      ending_balance = charity.balance
      expect(initial_balance < ending_balance).to be_truthy
    end
  end
end
