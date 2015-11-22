require "rails_helper"

RSpec.describe PrizePool, :type => :model do
  context 'hourly pool' do
    describe 'totaling process' do
      let!(:hourly_prize_pool) { PrizePool.where(name: "Hourly", payout_frequency: 3600).create }
      let!(:charity) { Charity.where(name: "Whirled Peas").create }
      let!(:user){ User.create }
      let!(:new_entry) { Entry.create(total: 1.00, charity_id: 1, recipient: user.btc_address, sender: user.btc_address) }
      let!(:old_entry) { Entry.create(total: 0.7500, charity_id: 1, recipient: user.btc_address, sender: user.btc_address) }

      before do
        old_entry.update_attributes!(created_at: (Time.now - 2.hours))
      end

      it 'has only entries from the last hour' do
        entries = hourly_prize_pool.get_the_entries
        entries.each do |entry|
          expect(entry.created_at < (Time.now - 1.hours)).to be_truthy
        end
      end

      # this will pass if you add pry... but otherwise it fails...
      # why god why?
      xit 'adds up the prize pool total from the last hours entries' do
        # the_prize_pool = PrizePool.where(name: 'Hourly').first
        # 100.times do
        #   puts "hourly_prize_pool.total: #{hourly_prize_pool.total}"
        # end
        # hourly_prize_pool.reload
        # Entry.all
        # User.all
        # PrizePool.all
        # Charity.all

        # binding.pry
        expect(hourly_prize_pool.total).to eq(0.00125)
      end
    end
  end

  context 'daily pool' do
    describe 'totaling process' do
      let!(:daily_prize_pool) { PrizePool.where(name: "Daily", payout_frequency: 3600*24).create }
      let!(:charity) { Charity.where(name: "Trump for President").create }
      let!(:user){ User.create }
      let!(:new_entry) { Entry.create(total: 1.00, charity_id: 1, recipient: user.btc_address, sender: user.btc_address) }
      let!(:old_entry) { Entry.create(total: 0.7500, charity_id: 1, recipient: user.btc_address, sender: user.btc_address) }

      before do
        old_entry.update_attributes!(created_at: (Time.now - 2.days))
      end

      it 'has only entries from the last day' do
        entries = daily_prize_pool.get_the_entries
        entries.each do |entry|
          expect(entry.created_at < (Time.now - 1.days)).to be_truthy
        end
      end
    end
  end

  context 'weekly pool' do
    describe 'totaling process' do
      let!(:weekly_prize_pool) { PrizePool.where(name: "Weekly", payout_frequency: 3600*24*7).create }
      let!(:charity) { Charity.where(name: "Shave the whales").create }
      let!(:user){ User.create }
      let!(:new_entry) { Entry.create(total: 1.00, charity_id: 1, recipient: user.btc_address, sender: user.btc_address) }
      let!(:old_entry) { Entry.create(total: 0.7500, charity_id: 1, recipient: user.btc_address, sender: user.btc_address) }

      before do
        old_entry.update_attributes!(created_at: (Time.now - 2.weeks))
      end

      it 'has only entries from the last day' do
        entries = weekly_prize_pool.get_the_entries
        entries.each do |entry|
          expect(entry.created_at < (Time.now - 1.weeks)).to be_truthy
        end
      end
    end
  end
end
