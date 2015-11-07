class BtcAddress
  def self.create
    @bc = BtcRemote.connect
    new_address = @bc.getnewaddress
    @bc.sendtoaddress(new_address, 5.0)
    @bc.generate(5)

    new_address
  end
end
