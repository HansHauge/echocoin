require "rails_helper"

RSpec.describe Entry, :type => :model do
  describe 'validations' do
    it "is not valid without a total" do
      @entry = Entry.new
      expect(@entry).not_to be_valid
      expect(@entry.errors[:total].include?("can't be blank")).to be_truthy
    end

    it 'is not valid when the total is non-numeric' do
      @entry = Entry.new(total: 'foo')
      expect(@entry).not_to be_valid
      expect(@entry.errors[:total].include?("is not a number")).to be_truthy
    end

    it 'is not valid when there is no recipient' do
      @entry = Entry.new
      expect(@entry).not_to be_valid
      expect(@entry.errors[:recipient].first).to eq("can't be blank")
    end

    it 'is not valid when there is no charity' do
      @entry = Entry.new
      expect(@entry).not_to be_valid
      expect(@entry.errors[:charity_id].first).to eq("can't be blank")
    end
  end
end
