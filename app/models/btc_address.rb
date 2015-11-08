class BtcAddress

  def self.create_with_no_coins(account_name)
    generate_account(account_name)
  end

  def self.create_with_coins(account_name)
    new_address = generate_account(account_name)
#    @bc.sendtoaddress(new_address, 5.0)
    @bc.move("", account_name, 5.0)
    @bc.generate(5)

    new_address
  end

  private

  def self.generate_account(account_name)
    @bc = BtcRemote.connect
    new_address = @bc.getnewaddress
    @bc.setaccount(new_address, account_name)

    new_address
  end
end
