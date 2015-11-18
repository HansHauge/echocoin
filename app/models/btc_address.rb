class BtcAddress

  def self.create_with_no_coins(account_nickname)
    generate_account(account_nickname)
  end

  def self.create_with_coins(account_nickname)
    new_address = generate_account(account_nickname)
#    @bc.sendtoaddress(new_address, 5.0)
    @bc.move("", account_nickname, 5.0)
    @bc.generate(5)

    new_address
  end

  private

  def self.generate_account(account_nickname)
    @bc = BtcRemote.connect
    new_address = @bc.getnewaddress
    @bc.setaccount(new_address, account_nickname)

    new_address
  end
end
