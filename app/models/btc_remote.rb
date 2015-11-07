class BtcRemote
  def self.connect
    RPC::JSON::Client.new "http://warrenv:warrenvPASS@45.79.175.63:18332", 1.1
  end
end
