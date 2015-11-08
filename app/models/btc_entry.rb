class BtcEntry

  def initialize(entry)
    @sender = entry.sender
    @recipient = entry.recipient
    @gross_amount = entry.amount
  end

  def submit(entry)
    @bc = BtcRemote.connect
#    sendmany "fromaccount" {"address":amount,...} ( minconf "comment" ["address",...] )
    @bc.sendmany ???, recipients
    @bc.generate(5)
  end

  def recipients
    {
      @recipient: @gross_amount,
      @us: amount_to_us,
      Charity.find(entry.charity).btc_address: amount_to_charity
    }.merge(prize_pool_amounts)
  end

  def amount_to_us
    @gross_amount * 0.005
  end

  def amount_to_charity
    @gross_amount * 0.005
  end

  def prize_pool_amounts
    num_pools = PrizePool.count

    PrizePool.inject({}) do |holder, pool|
      holder[pool.btc_address] = (@gross_amount * 0.005) / num_pools
      holder
    end
  end
end
